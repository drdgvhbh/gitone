// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reference _$ReferenceFromJson(Map<String, dynamic> json) {
  return Reference(json['name'] as String,
      type: _$enumDecodeNullable(_$ReferenceTypeEnumMap, json['type']));
}

Map<String, dynamic> _$ReferenceToJson(Reference instance) => <String, dynamic>{
      'type': _$ReferenceTypeEnumMap[instance.type],
      'name': instance.name
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$ReferenceTypeEnumMap = <ReferenceType, dynamic>{
  ReferenceType.Local: 'Local',
  ReferenceType.Remote: 'Remote',
  ReferenceType.Tag: 'Tag',
  ReferenceType.Head: 'Head',
  ReferenceType.Unknown: 'Unknown'
};

Commit _$CommitFromJson(Map<String, dynamic> json) {
  return Commit(
      hash: json['hash'] as String,
      summary: json['summary'] as String,
      references: (json['references'] as List)
          ?.map((e) =>
              e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CommitToJson(Commit instance) => <String, dynamic>{
      'hash': instance.hash,
      'summary': instance.summary,
      'references': instance.references
    };

RepositoryState _$RepositoryStateFromJson(Map<String, dynamic> json) {
  return RepositoryState(
      url: json['url'] as String,
      commits: (json['commits'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(
            k, e == null ? null : Commit.fromJson(e as Map<String, dynamic>)),
      ),
      selectedHash: json['selectedHash'] as String,
      changes: (json['changes'] as List)
          ?.map((e) =>
              e == null ? null : Change.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RepositoryStateToJson(RepositoryState instance) =>
    <String, dynamic>{
      'url': instance.url,
      'commits': instance.commits,
      'selectedHash': instance.selectedHash,
      'changes': instance.changes
    };

Change _$ChangeFromJson(Map<String, dynamic> json) {
  return Change(
      type: _$enumDecodeNullable(_$ChangeTypeEnumMap, json['type']),
      filePath: json['filePath'] as String);
}

Map<String, dynamic> _$ChangeToJson(Change instance) => <String, dynamic>{
      'type': _$ChangeTypeEnumMap[instance.type],
      'filePath': instance.filePath
    };

const _$ChangeTypeEnumMap = <ChangeType, dynamic>{
  ChangeType.INSERT: 'INSERT',
  ChangeType.MODIFY: 'MODIFY',
  ChangeType.DELETE: 'DELETE'
};
