import 'package:gitone/persistence/Storage.dart';
import 'package:git/git.dart';

class HardDriveStorage implements Storage {
  Future<GitDir> openGitRepository(String location) async {
    final isGitRepo = await GitDir.isGitDir(location);
    if (!isGitRepo) {
      return null;
    }

    return GitDir.fromExisting(location);
  }
}
