import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/countdown_page.dart';
import 'CardCountDown.dart';
import 'Event.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class EventCardd {
  final Event event;

  EventCardd(this.event);

  Card getCard(BuildContext context) {
    return Card(
      // elevation: 3.0,
      color: Color.fromRGBO(40, 40, 40, 1),
      child: InkWell(
        splashColor: lightPurple.withOpacity(0.4),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CountDownPage(event)),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            topBarCard(event.eTitle, event.eDescription, IconData(event.eIconCodePoint, fontFamily: 'MaterialIcons')),
            CardCountDown(event),
            cardButtonBar(),
          ],
        ),
      ),
    );
  }

  Widget topBarCard(String title, String description, IconData icon) => ListTile(
        leading: Icon(
          icon,
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

  Widget dateShower(List<String> times) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: times[0],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: whiteTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: '\nDAYS',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    )),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          RichText(
            text: TextSpan(
              text: times[1],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: whiteTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: '\nHOURS',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    )),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          RichText(
            text: TextSpan(
              text: times[2],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: whiteTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: '\nMINUTES',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    )),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          RichText(
            text: TextSpan(
              text: times[3],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: whiteTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: '\nSECONDS',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    )),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }

  Widget cardButtonBar() {
    return ButtonBar(
      children: <Widget>[
        ElevatedButton(
          // splashColor: lightPurple.withAlpha(150),
          onPressed: () {
            print("Edit button");
          },
          child: Icon(
            Icons.edit,
            color: whiteTextColor,
          ),
        ),
        ElevatedButton(
          // splashColor: lightPurple.withAlpha(150),
          child: Icon(
            Icons.drag_handle,
            color: whiteTextColor,
          ),
          onPressed: () {
            print("Move button");
          },
        ),
      ],
    );
  }
}
