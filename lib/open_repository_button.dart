import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';

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
    return StoreConnector<RepositoryState, Future<void> Function()>(
        converter: (store) {
      return () async {
        try {
          setState(() {
            _isWaitingForDialogToBeChosen = true;
          });
          debugPrint("call me back");
          final String path = await platform.invokeMethod(
              "openDirectory", <String, dynamic>{"title": "Open a Repository"});
          store.dispatch(OpenRepositoryAction(path));
        } catch (err) {
          debugPrint("Error: " + err.toString());
        } finally {
          setState(() {
            _isWaitingForDialogToBeChosen = false;
          });
        }
      };
    }, builder: (context, callback) {
      return MaterialButton(
          child: Text("Open a Repository"),
          onPressed: _isWaitingForDialogToBeChosen ? null : () => callback());
    });
  }
}
