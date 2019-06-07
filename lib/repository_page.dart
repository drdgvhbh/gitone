import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitone/repository/state.dart';
import 'package:gitone/widgets/CommitList.dart';
import 'package:redux/redux.dart';

class RepositoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RepositoryState, Store<RepositoryState>>(
        converter: (store) => store,
        builder: (context, store) {
          final state = store.state;
          final changes = state.changes;
          return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[CommitList()],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: ListView.builder(
                      itemCount: changes.length,
                      itemBuilder: (context, position) {
                        final change = changes[position];
                        return Container(
                          margin: EdgeInsets.all(4.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(4.0),
                                width: 24,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0))),
                                child: Center(
                                  child: Text(
                                    change.letterRepr(),
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  change.filePath,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).build(context),
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
