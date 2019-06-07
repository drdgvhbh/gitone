import 'package:gitone/repository/state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'actions.g.dart';

@JsonSerializable()
class OpenRepositoryAction {
  final String url;

  OpenRepositoryAction(this.url);

  factory OpenRepositoryAction.fromJson(Map<String, dynamic> json) =>
      _$OpenRepositoryActionFromJson(json);

  Map<String, dynamic> toJson() => _$OpenRepositoryActionToJson(this);
}

@JsonSerializable()
class OpenRepositorySuccessAction {
  final List<Commit> commits;

  OpenRepositorySuccessAction(this.commits);

  factory OpenRepositorySuccessAction.fromJson(Map<String, dynamic> json) =>
      _$OpenRepositorySuccessActionFromJson(json);

  Map<String, dynamic> toJson() => _$OpenRepositorySuccessActionToJson(this);
}

class OpenRepositoryFailedAction {
  final Exception error;

  OpenRepositoryFailedAction(this.error);
}

@JsonSerializable()
class SetSelectedCommitAction {
  final String commitHash;

  SetSelectedCommitAction(this.commitHash);

  factory SetSelectedCommitAction.fromJson(Map<String, dynamic> json) =>
      _$SetSelectedCommitActionFromJson(json);

  Map<String, dynamic> toJson() => _$SetSelectedCommitActionToJson(this);
}

@JsonSerializable()
class SetCommitDiffAction {
  final List<Change> changes;

  SetCommitDiffAction(this.changes);

  factory SetCommitDiffAction.fromJson(Map<String, dynamic> json) =>
      _$SetCommitDiffActionFromJson(json);

  Map<String, dynamic> toJson() => _$SetCommitDiffActionToJson(this);
}

@JsonSerializable()
class UnableToFetchCommitDiffAction {
  final String commitHash;

  UnableToFetchCommitDiffAction(this.commitHash);

  factory UnableToFetchCommitDiffAction.fromJson(Map<String, dynamic> json) =>
      _$UnableToFetchCommitDiffActionFromJson(json);

  Map<String, dynamic> toJson() => _$UnableToFetchCommitDiffActionToJson(this);
}
