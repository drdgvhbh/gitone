import 'package:gitone/repository/state.dart';

RegExp localReferenceRegExp = new RegExp(r"(^refs/heads/)(.*)");
RegExp remoteReferenceRegExp = new RegExp(r"(^refs/remotes/)(.*)");
RegExp tagReferenceRegExp = new RegExp(r"(^refs/tags/)(.*)");
RegExp headReferenceRegExp = new RegExp(r"(^HEAD$)");

Reference mapReference(String ref) {
  if (localReferenceRegExp.hasMatch(ref)) {
    final branchName = localReferenceRegExp.firstMatch(ref).group(2);
    return Reference(branchName, type: ReferenceType.Local);
  } else if (remoteReferenceRegExp.hasMatch(ref)) {
    final branchName = remoteReferenceRegExp.firstMatch(ref).group(2);
    return Reference(branchName, type: ReferenceType.Remote);
  } else if (headReferenceRegExp.hasMatch(ref)) {
    return Reference(ref, type: ReferenceType.Head);
  } else if (tagReferenceRegExp.hasMatch(ref)) {
    final branchName = tagReferenceRegExp.firstMatch(ref).group(2);
    return Reference(branchName, type: ReferenceType.Tag);
  }

  return Reference(ref, type: ReferenceType.Unknown);
}
