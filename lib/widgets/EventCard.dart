import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/countdown_page.dart';
import 'CardCountDown.dart';
import 'Event.dart';

class EventCard {
  final Function onTap;
  final Event event;

  EventCard(this.onTap, this.event);
  // Getters en Setters nodig denk ik

  // Een functie maken die een Card kan uitspugen die we kunnen opslaan en daarna kunnen laten zien op het hoofdscherm

  // TODO dit is volgens mij niet meer nodig sinds we een countdown library gebruiken
  List<String> restingTime(DateTime eventDate) {
    final now = DateTime.now();
    var total = eventDate.difference(now).inSeconds;

    final days = (total / 86400).floor();
    total -= days * 86400;

    final hours = (total / 3600).floor();
    total -= hours * 3600;

    final minutes = (total / 60).floor();
    total -= minutes * 60;

    final seconds = total % 60;

    List<int> list = [days, hours, minutes, seconds];
    return list.map((e) => e.toString()).toList();
  }

  Widget getCard(BuildContext context) {
    // TODO dit moet er natuurlijk anders uit gaan zien omdat je een CardCountDown gebruikt
    List<String> times = restingTime(event.eDate);
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

  // TODO deze functie is uiteindelijk niet meer nodig
  Widget makeEventCardFromEvent(BuildContext context, Event event) {
    List<String> times = restingTime(event.eDate);
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
            dateShower(times), // hier geef je natuurlijk de resterende dagen, uren, minuten en seconden
            cardButtonBar(),
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

  // TODO dit wordt uiteindelijk de CardCountDown widget
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
        FlatButton(
          splashColor: lightPurple.withAlpha(150),
          onPressed: () {
            print("Edit button");
          },
          child: Icon(
            Icons.edit,
            color: whiteTextColor,
          ),
        ),
        FlatButton(
          splashColor: lightPurple.withAlpha(150),
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
