import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

enum ReferenceType { Local, Remote, Tag, Head, Unknown }

@immutable
@JsonSerializable()
class Reference {
  final ReferenceType type;

  final String name;

  Reference(this.name, {this.type});

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceToJson(this);

  @override
  String toString() {
    return 'Reference{name: $name, type: $type}';
  }
}

@immutable
@JsonSerializable()
class Commit {
  final String hash;
  final String summary;
  final List<Reference> references;

  Commit({this.hash, this.summary, this.references});

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);

  Map<String, dynamic> toJson() => _$CommitToJson(this);

  @override
  String toString() {
    return 'Commit{hash: $hash, summary: $summary}';
  }
}

@immutable
@JsonSerializable()
class RepositoryState {
  final String url;
  final List<Commit> commits;

  RepositoryState({this.url = "", this.commits = const []});

  RepositoryState copyWith({String url, List<Commit> commits}) {
    return RepositoryState(
        url: url ?? this.url, commits: commits ?? this.commits);
  }

  factory RepositoryState.fromJson(Map<String, dynamic> json) =>
      _$RepositoryStateFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryStateToJson(this);

  @override
  String toString() {
    return 'RepositoryState{url: $url, commits: $commits}';
  }
}
