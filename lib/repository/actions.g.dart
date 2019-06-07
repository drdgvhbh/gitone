// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenRepositoryAction _$OpenRepositoryActionFromJson(Map<String, dynamic> json) {
  return OpenRepositoryAction(json['url'] as String);
}

Map<String, dynamic> _$OpenRepositoryActionToJson(
        OpenRepositoryAction instance) =>
    <String, dynamic>{'url': instance.url};

OpenRepositorySuccessAction _$OpenRepositorySuccessActionFromJson(
    Map<String, dynamic> json) {
  return OpenRepositorySuccessAction((json['commits'] as List)
      ?.map(
          (e) => e == null ? null : Commit.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$OpenRepositorySuccessActionToJson(
        OpenRepositorySuccessAction instance) =>
    <String, dynamic>{'commits': instance.commits};

SetSelectedCommitAction _$SetSelectedCommitActionFromJson(
    Map<String, dynamic> json) {
  return SetSelectedCommitAction(json['commitHash'] as String);
}

Map<String, dynamic> _$SetSelectedCommitActionToJson(
        SetSelectedCommitAction instance) =>
    <String, dynamic>{'commitHash': instance.commitHash};

SetCommitDiffAction _$SetCommitDiffActionFromJson(Map<String, dynamic> json) {
  return SetCommitDiffAction((json['changes'] as List)
      ?.map(
          (e) => e == null ? null : Change.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$SetCommitDiffActionToJson(
        SetCommitDiffAction instance) =>
    <String, dynamic>{'changes': instance.changes};

UnableToFetchCommitDiffAction _$UnableToFetchCommitDiffActionFromJson(
    Map<String, dynamic> json) {
  return UnableToFetchCommitDiffAction(json['commitHash'] as String);
}

Map<String, dynamic> _$UnableToFetchCommitDiffActionToJson(
        UnableToFetchCommitDiffAction instance) =>
    <String, dynamic>{'commitHash': instance.commitHash};
