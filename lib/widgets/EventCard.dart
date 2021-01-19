import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/countdown_page.dart';

class EventCard {
  // Getters en Setters nodig denk ik

  // Een functie maken die een Card kan uitspugen die we kunnen opslaan en daarna kunnen laten zien op het hoofdscherm

  Widget makeEventCard(BuildContext context, String title, String description, IconData icon, DateTime date) {
    return Card(
      // elevation: 3.0,
      color: Color.fromRGBO(40, 40, 40, 1),
      child: InkWell(
        splashColor: Color.fromRGBO(190, 129, 248, 1),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            topBarCard(title, description, icon),
            dateShower(), // hier geef je natuurlijk de resterende dagen, uren, minuten en seconden
            cardButtonBar(),
          ],
        ),
      ),
    );
  }

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

  Widget dateShower() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: '3',
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
              text: '4',
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
              text: '20',
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
              text: '27',
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
          splashColor: ligthPurple.withAlpha(150),
          onPressed: () {
            print("Edit button");
          },
          child: Icon(
            Icons.edit,
            color: whiteTextColor,
          ),
        ),
        FlatButton(
          splashColor: ligthPurple.withAlpha(150),
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
