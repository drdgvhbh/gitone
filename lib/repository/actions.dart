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
class SetSelectedCommitHashAction {
  final String commitHash;

  SetSelectedCommitHashAction(this.commitHash);

  factory SetSelectedCommitHashAction.fromJson(Map<String, dynamic> json) =>
      _$SetSelectedCommitHashActionFromJson(json);

  Map<String, dynamic> toJson() => _$SetSelectedCommitHashActionToJson(this);
}
