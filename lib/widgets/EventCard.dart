import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/countdown_page.dart';
import 'CardCountDown.dart';
import 'Event.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Color.fromRGBO(29, 29, 29, 0.95),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Container(width: 10, height: 200, color: Color(event.color)),
          Expanded(
            child: Column(
              children: <Widget>[
                TopBar(title: event.eTitle, description: event.eDescription, icon: event.eIconCodePoint),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: DateShower(times: ['10', '23', '59', '59']),
                ),
                // cardButtonBar(context),
              ],
            ),
          ),
        ],
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
        color: Color.fromRGBO(143, 143, 143, 1),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromRGBO(143, 143, 143, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(color: Color.fromRGBO(143, 143, 143, 1)),
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
}

class CardButtonBar extends StatelessWidget {
  const CardButtonBar({Key? key}) : super(key: key);

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
