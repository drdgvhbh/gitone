import 'package:flutter/material.dart';
import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';
import 'package:gitserver/api.dart' as Git;
import 'package:redux/redux.dart';
import 'package:gitone/repository/reference.mapper.dart';

void openRepository(Store<RepositoryState> store, action, NextDispatcher next) {
  if (action is OpenRepositoryAction) {
    final apiInstance =
        new Git.DefaultApi(Git.ApiClient(basePath: "http://localhost:8000/v1"));
    apiInstance.apiClient.getAuthentication<Git.ApiKeyAuth>('api_key').apiKey =
        "e8b8dc29-d1d9-495d-b509-4dde3701018b";

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
  }

  next(action);
}
