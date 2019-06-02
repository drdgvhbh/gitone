import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitone/open_repository_button.dart';
import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/middleware.dart';
import 'package:gitone/repository/reducer.dart';
import 'package:gitone/repository/state.dart';
import 'package:gitone/repository_page.dart';
import 'package:gitone/routes.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:flutter/rendering.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final remoteDevtools = RemoteDevToolsMiddleware('localhost:8564');

Future<void> main() async {
  // debugPaintSizeEnabled = true;
  final store = DevToolsStore<RepositoryState>(repositoryReducer,
      initialState: RepositoryState(),
      middleware: [
        remoteDevtools,
        openRepository,
        LoggingMiddleware.printer(),
        RoutingMiddleware(navigatorKey)
      ]);
  remoteDevtools.store = store;
  await remoteDevtools.connect();
  runApp(MyApp(store));
}

Future<void> runMain() async {
  main();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Store<RepositoryState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<RepositoryState>(
      store: store,
      child: MaterialApp(
        title: 'Git One',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            colorScheme: ColorScheme.dark(),
            textTheme: TextTheme(
                body1: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 13.5),
                body2: TextStyle(color: Colors.white))),
        navigatorKey: navigatorKey,
        routes: {
          Routes.home: (context) {
            return MyHomePage(title: 'Git One');
          },
          Routes.repo: (context) {
            return RepositoryPage();
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 42, 51),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OpenARepositoryButton(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
