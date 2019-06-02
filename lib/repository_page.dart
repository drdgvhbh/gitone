import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitone/repository/state.dart';

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

class RepositoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RepositoryState, List<Commit>>(
        converter: (store) => store.state.commits,
        builder: (context, commits) {
          return Scaffold(
              backgroundColor: Color.fromARGB(255, 27, 42, 51),
              body: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Scrollbar(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8.0),
                              itemCount: commits.length,
                              itemBuilder: (context, position) {
                                final commit = commits[position];
                                final references = commit.references;
                                final hash = commit.hash;
                                final summary = commit.summary;
                                return Card(
                                  margin: new EdgeInsets.all(0),
                                  child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 22, 36, 44)),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 8.0),
                                              child: Row(
                                                children: references
                                                    .map((ref) => Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 4.0, 0),
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            color:
                                                                referenceTypeToColor(
                                                                    ref.type),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        4.0))),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            ref.name,
                                                            style: Theme.of(
                                                                    context)
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).build(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text("yoloswag"),
                  )
                ],
              ));
        });
  }
}

class Rects extends StatelessWidget {
  final List<Rect> rects;
  final void Function(int) onSelected;
  final int selectedIndex;

  const Rects({
    Key key,
    @required this.rects,
    @required this.onSelected,
    this.selectedIndex = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        RenderBox box = context.findRenderObject();
        final offset = box.globalToLocal(details.globalPosition);
        final index = rects.lastIndexWhere((rect) => rect.contains(offset));
        if (index != -1) {
          onSelected(index);
          return;
        }
        onSelected(-1);
      },
      child: CustomPaint(
        size: Size(320, 240),
        painter: _RectPainter(rects, selectedIndex),
      ),
    );
  }
}

class _RectPainter extends CustomPainter {
  static Paint _red = Paint()..color = Colors.red;
  static Paint _blue = Paint()..color = Colors.blue;

  final List<Rect> rects;
  final int selectedIndex;

  _RectPainter(this.rects, this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    var i = 0;
    for (Rect rect in rects) {
      canvas.drawRect(rect, i++ == selectedIndex ? _red : _blue);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
