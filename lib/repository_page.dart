import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitone/repository/state.dart';

class RepositoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: StoreConnector<RepositoryState, List<Commit>>(
            converter: (store) => store.state.commits,
            builder: (context, commits) {
              return ListView.builder(
                itemCount: commits.length,
                itemBuilder: (context, position) {
                  debugPrint(commits[position].hash);
                  return Text(commits[position].hash);
                },
              ).build(context);
            }));
  }
}
