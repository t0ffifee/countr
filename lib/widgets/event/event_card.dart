import 'package:countdown_app/screens/countdown_page.dart';
import 'package:countdown_app/screens/edit_page.dart';
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
                    TopBar(title: event.eTitle, description: event.eDescription, icon: event.eIconCodePoint),
                    Padding(
                      padding: EdgeInsets.only(left: 35, top: 2, right: 35),
                      child: DateShower(times: ['10', '23', '59', '59']),
                    ),
                    CardButtonBar(event: event),
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
      trailing: ReorderableDragStartListener(
        index: 0,
        child: Icon(
          Icons.drag_handle,
          color: onSurfaceWhite,
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
  const CardButtonBar({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    final Widget dialog = Theme(
      data: ThemeData(
        brightness: Brightness.dark,
      ),
      child: AlertDialog(
        title: Text('Delete Event?'),
        content: Text('This will remove this event from the list and stop notifying you.'),
        actions: [
          TextButton(
            onPressed: () {
              print('delete event');
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text('CONFIRM'),
          ),
        ],
      ),
    );

    return ButtonBar(
      children: <Widget>[
        Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage(event: event)),
                );
              } else if (value == 2) {
                showDialog<void>(context: context, builder: (context) => dialog);
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
