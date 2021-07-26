import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:countdown_app/widgets/expandable_fab.dart';

import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/constants/globals.dart';
import 'package:countdown_app/widgets/event/event.dart';
import 'package:countdown_app/widgets/event/event_card.dart';

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
  @override
  Widget build(context) {
    print("[BUILD] MyAppState is gebouwd");

    bool _visible = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundBlack,
        floatingActionButton: Visibility(
          visible: _visible,
          child: ExpandableFab(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Center(
          child: Container(
            color: backgroundBlack,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: getChildren(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    return [
      Divider(),
      EventCard(
        event: Event(DateTime(2021, 10, 5), 'Tandarts', 'Gebits controle', Icons.alarm.codePoint, Colors.purple.shade300.value, false),
      ),
      Divider(),
      EventCard(
        event: Event(DateTime(2021, 10, 5), 'Tandarts', 'Gebits controle', Icons.alarm.codePoint, Colors.purple.shade300.value, false),
      ),
      Divider(),
      EventCard(
        event: Event(DateTime(2021, 10, 5), 'Tandarts', 'Gebits controle', Icons.alarm.codePoint, Colors.purple.shade300.value, false),
      ),
      Divider(),
      EventCard(
        event: Event(DateTime(2021, 10, 5), 'Tandarts', 'Gebits controle', Icons.alarm.codePoint, Colors.purple.shade300.value, false),
      ),
      Divider(),
    ];
  }
}
