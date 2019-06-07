import 'package:flutter/material.dart';
import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';
import 'package:gitserver/api.dart' as Git;
import 'package:redux/redux.dart';
import 'package:gitone/repository/reference.mapper.dart';

List<Middleware<RepositoryState>> createRepositoryMiddleware() {
  final apiInstance =
      new Git.DefaultApi(Git.ApiClient(basePath: "http://localhost:8000/v1"));
  apiInstance.apiClient.getAuthentication<Git.ApiKeyAuth>('api_key').apiKey =
      "e8b8dc29-d1d9-495d-b509-4dde3701018b";

  return [
    TypedMiddleware<RepositoryState, OpenRepositoryAction>(
        _createOpenRepository(apiInstance)),
    TypedMiddleware<RepositoryState, SetSelectedCommitAction>(
        _createShowCurrentCommitDiff(apiInstance))
  ];
}

Middleware<RepositoryState> _createOpenRepository(Git.DefaultApi apiInstance) {
  return (Store<RepositoryState> store, _action, NextDispatcher next) {
    final action = _action as OpenRepositoryAction;
    final path = action.url;

    apiInstance
        .listCommits(path.replaceAll("/", "|"))
        .asStream()
        .map(((response) => response.data))
        .map((commits) => commits.map((commit) => Commit(
            hash: commit.hash,
            summary: commit.summary,
            references: commit.references.map(mapReference).toList())))
        .first
        .then((commits) =>
            store.dispatch(OpenRepositorySuccessAction(commits.toList())))
        .catchError((err) {
      debugPrint(err.toString());
      return store.dispatch(OpenRepositoryFailedAction(err));
    });

    next(action);
  };
}

Middleware<RepositoryState> _createShowCurrentCommitDiff(
    Git.DefaultApi apiInstance) {
  return (Store<RepositoryState> store, _action, NextDispatcher next) {
    final action = _action as SetSelectedCommitAction;
    final path = store.state.url;

    apiInstance
        .getCommitChanges(path.replaceAll("/", "|"), action.commitHash)
        .asStream()
        .map(((response) => response.data))
        .map((changes) => changes.map((change) {
              final type = () {
                switch (change.type) {
                  case 'MODIFY':
                    return ChangeType.MODIFY;
                  case 'INSERT':
                    return ChangeType.INSERT;
                  case 'DELETE':
                    return ChangeType.DELETE;
                  default:
                    break;
                }
              }();

              return Change(filePath: change.path, type: type);
            }).toList())
        .first
        .then((changes) => store.dispatch(SetCommitDiffAction(changes)))
        .catchError((err) {
      debugPrint(err.toString());
      store.dispatch(UnableToFetchCommitDiffAction(action.commitHash));
    });

    next(action);
  };
}
