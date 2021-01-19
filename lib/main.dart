import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/countdown_page.dart';
import 'constants/constants.dart';
import 'widgets/FancyFab.dart';
import 'widgets/EventCard.dart';

// TODO maak aparte widget files voor belangrijke widgets die je vaak gebruikt of groot zijn

void main() async {
  await Hive.initFlutter();
  runApp(MaterialApp(
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
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              topContainer,
              cardMaker(context, "Verjaardag Henk", "Mijn beste vriend Henk is jarig", Icons.cake),
              cardMaker(context, "Kinderboerderij", "Mijn kinderboerderij openen", Icons.agriculture),
              // cardInContainer(context, Colors.blue),
              // cardInContainer(context, Colors.purple),
              // cardInContainer(context, Colors.red),
              // cardInContainer(context, Colors.yellow),
              // cardInContainer(context, Colors.green),
              bottomContainer,
            ],
          ),
        ),
        backgroundColor: backgroundBlack,
        floatingActionButton: FancyFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

Container topContainer = Container(
  height: 30,
  color: Color.fromRGBO(18, 18, 18, 1),
);

Container bottomContainer = Container(
  height: 70,
  color: Color.fromRGBO(18, 18, 18, 1),
  margin: EdgeInsets.only(top: 10),
);

Container cardInContainer(BuildContext context, Color color) {
  return Container(
    margin: EdgeInsets.only(top: 5, bottom: 5),
    decoration: BoxDecoration(borderRadius: BorderRadius.vertical(), boxShadow: [
      BoxShadow(
        color: color,
        blurRadius: 3.0,
        spreadRadius: 1.0,
        offset: Offset(
          0.0,
          0.01,
        ),
      ),
    ]),
    child: cardMaker(context, "Titel hai", "Beschrijving", Icons.accessibility),
  );
}

Card cardMaker(BuildContext context, String title, String description, IconData icon) {
  EventCard eCard = new EventCard();
  DateTime now = DateTime.now();
  Card card = eCard.makeEventCard(context, title, description, icon, DateTime.utc(2021, 2, 4));
  return card;
}
