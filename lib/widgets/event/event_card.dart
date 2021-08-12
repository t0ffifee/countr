import 'package:countdown_app/screens/countdown_page.dart';
import 'package:flutter/material.dart';
import 'package:countdown_app/constants/constants.dart';
import 'package:flutter/rendering.dart';
import 'event.dart';

class EventCard extends StatelessWidget {
  const EventCard({required Key key, required this.event}) : super(key: key);
  final Event event;

// Functie voor het gaan naar de CountDownPage
  void cardFunction(BuildContext context, Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CountDownPage(event)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = 180;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      height: height,
      child: GestureDetector(
        onTap: () => cardFunction(context, event),
        child: Card(
          elevation: 1,
          color: Color.fromRGBO(29, 29, 29, 0.95),
          // clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Container(width: 10, height: height, color: Color(event.color)),
              Expanded(
                child: Column(
                  children: <Widget>[
                    TopBar(
                        title: event.eTitle,
                        description: event.eDescription,
                        icon: event.eIconCodePoint),
                    Padding(
                      padding: EdgeInsets.only(left: 35, top: 2, right: 35),
                      child: DateShower(times: ['10', '23', '59', '59']),
                    ),
                    CardButtonBar(context: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final String title;
  final String description;
  final int icon;

  TopBar({required this.title, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        IconData(icon, fontFamily: 'MaterialIcons'),
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
    );
  }
}

class DateShower extends StatelessWidget {
  final List<String> times;

  DateShower({required this.times});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElementShower(times: times, index: 0, unit: "DAYS"),
          Container(width: 10),
          ElementShower(times: times, index: 1, unit: "HOURS"),
          Container(width: 10),
          ElementShower(times: times, index: 2, unit: "MINUTES"),
          Container(width: 10),
          ElementShower(times: times, index: 3, unit: "SECONDS"),
        ],
      ),
    );
  }
}

class ElementShower extends StatelessWidget {
  final List<String> times;
  final int index;
  final String unit;

  ElementShower({required this.times, required this.index, required this.unit});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: times[index],
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: whiteTextColor,
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
}

class CardButtonBar extends StatelessWidget {
  final BuildContext context;

  CardButtonBar({required this.context});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        IconButton(
          splashRadius: splashRadiusIconButtonCard,
          icon: Icon(Icons.edit, color: onSurfaceWhite),
          onPressed: () {
            print("Edit Button");
          },
        ),
      ],
    );
  }
}
