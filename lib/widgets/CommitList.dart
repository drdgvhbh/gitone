import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';
import 'package:redux/redux.dart';

Color referenceTypeToColor(ReferenceType type) {
  switch (type) {
    case ReferenceType.Local:
      return Color.fromARGB(255, 79, 110, 128);
    case ReferenceType.Remote:
      return Color.fromARGB(255, 54, 100, 128);
    case ReferenceType.Head:
      return Color.fromARGB(255, 120, 84, 36);
    case ReferenceType.Tag:
      return Color.fromARGB(255, 25, 56, 51);
    default:
      return Color.fromARGB(255, 0, 0, 0);
  }
}

class CommitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RepositoryState, Store<RepositoryState>>(
        converter: (store) => store,
        builder: (context, store) {
          final state = store.state;
          final commitBackground = Color.fromARGB(255, 22, 36, 44);
          final selectedCommitBackground = Color.fromARGB(225, 22, 36, 44);
          final commits = state.commits.values.toList();
          final selectedHash = state.selectedHash;
          return Flexible(
            child: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: commits.length,
                itemBuilder: (context, position) {
                  final commit = commits[position];
                  final references = commit.references;
                  final hash = commit.hash;
                  final summary = commit.summary;
                  final isSelected = selectedHash == hash;
                  return GestureDetector(
                    onTap: () {
                      store.dispatch(SetSelectedCommitAction(hash));
                    },
                    child: Card(
                      margin: new EdgeInsets.all(0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: isSelected
                                ? selectedCommitBackground
                                : commitBackground),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                                  child: Row(
                                    children: references
                                        .map((ref) => Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 4.0, 0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: referenceTypeToColor(
                                                    ref.type),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),
                                            child: Container(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                ref.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body1,
                                              ),
                                            )))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                summary,
                                style: Theme.of(context).textTheme.body1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).build(context),
            ),
          );
        });
  }
}
