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

  // Event test = Event(DateTime.utc(2021, 3, 8), "Henk is Jarig", "Verjaardag van Henk", Icons.cake.codePoint);
  // box.add(test);

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: mainBody(context),
        body: mainBody2(context),
        backgroundColor: backgroundBlack,
        floatingActionButton: FancyFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

Widget mainBody2(BuildContext context) {
  return Center(
    child: ListView(
      children: [
        getCard(context, "Countr Release", "The release date of this app", Icons.phone_android),
        getCard(context, "Countr Release", "The release date of this app", Icons.phone_android),
        getCard(context, "Countr Release", "The release date of this app", Icons.phone_android),
        getCard(context, "Countr Release", "The release date of this app", Icons.phone_android),
        getCard(context, "Countr Release", "The release date of this app", Icons.phone_android),
      ],
    ),
  );
}

Widget mainBody(BuildContext context) {
  return ValueListenableBuilder(
    valueListenable: Hive.box<Event>(eventBox).listenable(),
    builder: (context, box, widget) {
      return Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: cardsCreator(context),
        ),
      );
    },
  );
}

void cardFunction(BuildContext context, Event event) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CountDownPage(event)),
  );
}

Widget lijst(BuildContext context) {
  var events = Hive.box<Event>(eventBox);

  if (events.length > 0) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        EventCard eCard = EventCard(
          () => cardFunction(context, events.getAt(index)),
          events.getAt(index),
        );
        return eCard.getCard(context);
      },
    );
  } else {
    return Container(
      width: 10,
      color: Colors.blue,
    );
  }
}

List<Widget> cardsCreator(BuildContext context) {
  print("[FUNCTION] cardsCreator is opgeroepen");
  List<Widget> eventCards = [];
  eventCards.add(topContainer);

  var box = Hive.box<Event>(eventBox);

  for (Event event in box.values) {
    EventCard eCard = new EventCard(cardFunction, event);
    print("[EVENT IN BOX] $event");
    Card card = eCard.getCard(context);
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

// FUNCTIES DIE ER NU STAAN OMDAT WE AAN DE FRONTEND WILLEN WERKEN:

Widget getCard(
  BuildContext context,
  String title,
  String description,
  IconData icon,
) {
  // TODO dit moet er natuurlijk anders uit gaan zien omdat je een CardCountDown gebruikt
  return Card(
    // elevation: 3.0,
    color: Color.fromRGBO(40, 40, 40, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      splashColor: lightPurple.withOpacity(0.4),
      onTap: () {
        print("er is iets gedrukt");
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.blue,
            height: 175,
            width: 10,
          ),
          Column(
            children: [
              Text("data"),
              Text("data"),
              dateShower(['3', '4', '4', '4']),
              cardButtonBar(context),
            ],
          )
        ],
      ),
    ),
  );
}

// TODO deze dingen hieronder horen duidelijk een eigen class te zijn
Widget topBarCard(String title, String description, IconData icon) {
  return ListTile(
    leading: Icon(
      icon,
      color: onSurfaceWhite,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: onSurfaceWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      description,
      style: TextStyle(color: whiteTextColor),
    ),
  );
}

// TODO dit wordt uiteindelijk de CardCountDown widget
Widget dateShower(List<String> times) {
  return Container(
    // margin: EdgeInsets.only(left: 40, right: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        timePart(times, 0, "DAYS"),
        Container(width: 10),
        timePart(times, 1, "HOURS"),
        Container(width: 10),
        timePart(times, 2, "MINUTES"),
        Container(width: 10),
        timePart(times, 3, "SECONDS"),
      ],
    ),
  );
}

Widget timePart(List<String> times, int index, String unit) {
  return RichText(
    text: TextSpan(
      text: times[index],
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: onSurfaceWhite,
      ),
      children: <TextSpan>[
        TextSpan(
            text: ('\n' + unit),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
            )),
      ],
    ),
    textAlign: TextAlign.center,
  );
}

Widget cardButtonBar(BuildContext context) {
  return ButtonBar(
    children: <Widget>[
      IconButton(
        focusColor: lightPurple,
        splashRadius: splashRadiusIconButtonCard,
        icon: Icon(
          Icons.edit,
          color: onSurfaceWhite,
        ),
        onPressed: () {
          print("Edit Button");
        },
      ),
    ],
  );
}
