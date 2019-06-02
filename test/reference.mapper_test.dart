import 'package:flutter_test/flutter_test.dart';
import 'package:gitone/repository/reference.mapper.dart';
import 'package:gitone/repository/state.dart';

void main() {
  test('should map a local branch reference', () {
    final ref = 'refs/heads/master';
    final mappedRef = mapReference(ref);

    expect(mappedRef.type, ReferenceType.Local);
    expect(mappedRef.name, "master");
  });
  test('should map a remote branch reference', () {
    final ref = 'refs/remotes/origin/master';
    final mappedRef = mapReference(ref);

    expect(mappedRef.type, ReferenceType.Remote);
    expect(mappedRef.name, "origin/master");
  });
  test('should map a HEAD reference', () {
    final ref = 'HEAD';
    final mappedRef = mapReference(ref);

    expect(mappedRef.type, ReferenceType.Head);
    expect(mappedRef.name, "HEAD");
  });

  test('should map a tag reference', () {
    final ref = 'refs/tags/testing';
    final mappedRef = mapReference(ref);

    expect(mappedRef.type, ReferenceType.Tag);
    expect(mappedRef.name, "testing");
  });
}
