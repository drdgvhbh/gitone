// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commit _$CommitFromJson(Map<String, dynamic> json) {
  return Commit(
      hash: json['hash'] as String, summary: json['summary'] as String);
}

Map<String, dynamic> _$CommitToJson(Commit instance) =>
    <String, dynamic>{'hash': instance.hash, 'summary': instance.summary};

RepositoryState _$RepositoryStateFromJson(Map<String, dynamic> json) {
  return RepositoryState(
      url: json['url'] as String,
      commits: (json['commits'] as List)
          ?.map((e) =>
              e == null ? null : Commit.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RepositoryStateToJson(RepositoryState instance) =>
    <String, dynamic>{'url': instance.url, 'commits': instance.commits};
