import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/countdown_page.dart';
import 'constants/constants.dart';
import 'widgets/FancyFab.dart';
import 'widgets/EventCard.dart';
import 'widgets/Event.dart';
import 'constants/globals.dart';

// TODO maak aparte widget files voor belangrijke widgets die je vaak gebruikt of groot zijn

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EventAdapter());

  var box = await Hive.openBox<Event>(eventBox);

  // Event test = Event(DateTime.utc(2021, 3, 8), "Henks Jarig", "Verjaardag van Henk", Icons.cake.codePoint);
  // box.add(test);

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
    print("[BUILD] MyAppState is gebouwd");
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: cardsCreator(context),
          ),
        ),
        backgroundColor: backgroundBlack,
        floatingActionButton: FancyFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

List<Widget> cardsCreator(BuildContext context) {
  print("[FUNCTION] cardsCreator is opgeroepen");
  List<Widget> eventCards = new List();
  eventCards.add(topContainer);

  var box = Hive.box<Event>(eventBox);

  EventCard eCard = new EventCard();
  for (Event event in box.values) {
    Card card = eCard.makeEventCardFromEvent(context, event);
    eventCards.add(card);
  }

  eventCards.add(bottomContainer);
  return eventCards;
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
