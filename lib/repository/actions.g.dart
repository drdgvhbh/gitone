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

SetSelectedCommitHashAction _$SetSelectedCommitHashActionFromJson(
    Map<String, dynamic> json) {
  return SetSelectedCommitHashAction(json['commitHash'] as String);
}

Map<String, dynamic> _$SetSelectedCommitHashActionToJson(
        SetSelectedCommitHashAction instance) =>
    <String, dynamic>{'commitHash': instance.commitHash};
