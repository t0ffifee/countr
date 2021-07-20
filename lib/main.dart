import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants/constants.dart';
import 'widgets/FancyFab.dart';
import 'widgets/EventCard.dart';
import 'widgets/Event.dart';
import 'constants/globals.dart';
import 'screens/countdown_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EventAdapter());

  Globals.events = await Hive.openBox<Event>(eventBox);
  Globals.events.clear();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green,
    ),
    title: 'CountDown',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Widget> myItems = [
    Container(color: Colors.blue, height: 100, width: 50, key: UniqueKey()),
    Container(color: Colors.red, height: 100, width: 50, key: UniqueKey()),
    Container(color: Colors.orange, height: 100, width: 50, key: UniqueKey()),
    Container(color: Colors.purple, height: 100, width: 50, key: UniqueKey())
  ];

  var _controller = ScrollController();
  var _visible = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels > 0) if (_visible)
          setState(() {
            _visible = false;
          });
      } else {
        if (!_visible)
          setState(() {
            _visible = true;
          });
      }
    });
  }

  @override
  Widget build(context) {
    print("[BUILD] MyAppState is gebouwd");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: mainBody(context),
        body: Center(
          child: ReorderableListView(
            scrollController: _controller,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = myItems.removeAt(oldIndex);
                myItems.insert(newIndex, item);
              });
            },
            children: [
              for (final item in myItems)
                Container(
                  key: UniqueKey(),
                  height: 100,
                  color: Colors.blue,
                  child: item,
                )
            ],
          ),
        ),
        backgroundColor: backgroundBlack,
        floatingActionButton: Visibility(visible: _visible, child: FancyFab()),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
