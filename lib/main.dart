import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  late ScrollController controller;
  bool fabIsVisible = true;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        fabIsVisible = controller.position.userScrollDirection == ScrollDirection.forward;
      });
    });
  }

  final List<Widget> children = [
    EventCard(
      key: Key('1'),
      event: Event(DateTime(2021, 10, 5), 'Vakantie Spanje', '', Icons.airplanemode_active.codePoint, Colors.purple.shade300.value, false),
    ),
    EventCard(
      key: Key('2'),
      event: Event(DateTime(2021, 10, 5), 'Tandarts', '', Icons.alarm.codePoint, Colors.blue.shade300.value, false),
    ),
    EventCard(
      key: Key('3'),
      event: Event(DateTime(2021, 10, 5), 'Dagje Strand', '', Icons.beach_access.codePoint, Colors.green.shade300.value, false),
    ),
    EventCard(
      key: Key('4'),
      event: Event(DateTime(2021, 10, 5), 'Wintervakantie', '', Icons.snowmobile.codePoint, Colors.red.shade300.value, false),
    ),
    EventCard(
      key: Key('5'),
      event: Event(DateTime(2021, 10, 5), 'Wintervakantie', '', Icons.snowmobile.codePoint, Colors.red.shade300.value, false),
    )
  ];

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundBlack,
        floatingActionButton: Visibility(
          child: ExpandableFab(),
          visible: fabIsVisible,
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Center(
          child: Container(
            color: backgroundBlack,
            child: reorListView(),
          ),
        ),
      ),
    );
  }

  Widget normalList() {
    // List<Widget> cs = getChildren();
    return ListView(
      padding: EdgeInsets.all(10),
      children: children,
    );
  }

  Widget reorListView() {
    // List<Widget> cs = getChildren();
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: ReorderableListView(
        scrollController: controller,
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        children: children,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Widget item = children.removeAt(oldIndex);
            children.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
