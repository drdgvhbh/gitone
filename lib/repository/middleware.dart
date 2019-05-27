import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';
import 'package:gitserver/api.dart';
import 'package:redux/redux.dart';

void openRepository(Store<RepositoryState> store, action, NextDispatcher next) {
  if (action is OpenRepositoryAction) {
    final apiInstance =
        new DefaultApi(ApiClient(basePath: "http://localhost:8000/v1"));
    apiInstance.apiClient.getAuthentication<ApiKeyAuth>('api_key').apiKey =
        "e8b8dc29-d1d9-495d-b509-4dde3701018b";

    final path = action.url;

    apiInstance
        .listCommits(path.replaceAll("/", "|"))
        .asStream()
        .map(((response) => response.data))
        .map((commits) => commits.map(
            (commit) => Commit(hash: commit.hash, summary: commit.summary)))
        .first
        .then((commits) =>
            store.dispatch(OpenRepositorySuccessAction(commits.toList())))
        .catchError((err) => store.dispatch(OpenRepositoryFailedAction(err)));
  }

  next(action);
}
