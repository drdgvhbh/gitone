import 'package:git/git.dart';

abstract class Storage {
  Future<GitDir> openGitRepository(String location);
}
