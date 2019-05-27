import 'package:flutter/material.dart';
import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';
import 'package:redux/redux.dart';

Reducer<RepositoryState> repositoryReducer = combineReducers<RepositoryState>([
  TypedReducer<RepositoryState, OpenRepositorySuccessAction>(_setCommits),
  TypedReducer<RepositoryState, OpenRepositoryAction>(_setUrl)
]);

RepositoryState _setCommits(
  RepositoryState state,
  OpenRepositorySuccessAction action,
) {
  return state.copyWith(commits: action.commits);
}

RepositoryState _setUrl(
  RepositoryState state,
  OpenRepositoryAction action,
) {
  debugPrint("?????????????????????");
  return state.copyWith(url: action.url);
}

RepositoryState counterReducer(RepositoryState state, dynamic action) {
  debugPrint(action.toString());

  return RepositoryState(url: "Why is tis doing ntohing", commits: []);
}
