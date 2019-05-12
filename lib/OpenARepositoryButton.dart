import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitone/persistence/HardDriveStorage.dart';

class OpenARepositoryButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OpenARepositoryButtonState();
}

class _OpenARepositoryButtonState extends State<OpenARepositoryButton> {
  static const platform = const MethodChannel('plugins.flutter.io/file_picker');

  bool _isWaitingForDialogToBeChosen;

  @override
  void initState() {
    _isWaitingForDialogToBeChosen = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text("Open a Repository"),
        onPressed:
            _isWaitingForDialogToBeChosen ? null : () => _openFileExplorer());
  }

  Future<void> _openFileExplorer() async {
    debugPrint(_isWaitingForDialogToBeChosen.toString());
    try {
      setState(() {
        _isWaitingForDialogToBeChosen = true;
      });
      final location = await platform.invokeMethod(
          "openDirectory", <String, dynamic>{"title": "Open a Repository"});
      final gitRepo = await HardDriveStorage().openGitRepository(location);
      final currentBranch = await gitRepo?.currentBranch();
      debugPrint(currentBranch.branchName);
      debugPrint(location);
    } catch (err) {
      debugPrint("Error" + err.toString());
    } finally {
      setState(() {
        _isWaitingForDialogToBeChosen = false;
      });
    }
  }
}
