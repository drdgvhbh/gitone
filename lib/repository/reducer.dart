import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';
import 'package:redux/redux.dart';

Reducer<RepositoryState> repositoryReducer = combineReducers<RepositoryState>([
  TypedReducer<RepositoryState, OpenRepositorySuccessAction>(_setCommits),
  TypedReducer<RepositoryState, OpenRepositoryAction>(_setUrl),
  TypedReducer<RepositoryState, SetSelectedCommitHashAction>(_setSelectedHash),
]);

RepositoryState _setCommits(
  RepositoryState state,
  OpenRepositorySuccessAction action,
) {
  return state.copyWith(
      commits: Map.fromIterable(action.commits,
          key: (v) => (v as Commit).hash, value: (v) => (v)),
      selectedHash: action.commits.length > 0 ? action.commits[0].hash : '');
}

RepositoryState _setUrl(
  RepositoryState state,
  OpenRepositoryAction action,
) {
  return state.copyWith(url: action.url);
}

RepositoryState _setSelectedHash(
  RepositoryState state,
  SetSelectedCommitHashAction action,
) {
  return state.copyWith(selectedHash: action.commitHash);
}
