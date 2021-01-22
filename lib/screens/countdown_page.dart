import 'package:flutter/material.dart';
import '../widgets/CountDown.dart';
import '../constants/constants.dart';
import '../widgets/Event.dart';

class CountDownPage extends StatelessWidget {
  final Event event;

  CountDownPage(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(height: 40),
            Text(
              "Een hele mooie titel",
              style: TextStyle(
                fontSize: 25,
                color: whiteTextColor,
                fontStyle: FontStyle.italic,
              ),
            ),
            CountDown(event),
            IconButton(
              splashColor: lightPurple,
              tooltip: "Return",
              icon: Icon(
                Icons.arrow_back,
                color: whiteTextColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      backgroundColor: backgroundBlack,
    );
  }
}

// TODO dit moet allemaal weg omdat het gefixed zal worden door CountDown()
RichText days = RichText(
  text: TextSpan(
    text: '3\t',
    style: TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(190, 129, 248, 0.7),
    ),
    children: <TextSpan>[
      TextSpan(
          text: 'D',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 40,
          )),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText hours = RichText(
  text: TextSpan(
    text: '4\t',
    style: TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(190, 129, 248, 0.7),
    ),
    children: <TextSpan>[
      TextSpan(
          text: 'H',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            fontSize: 40,
          )),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText minutes = RichText(
  text: TextSpan(
    text: '20\t',
    style: TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(190, 129, 248, 0.7),
    ),
    children: <TextSpan>[
      TextSpan(
          text: 'M',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            fontSize: 40,
          )),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText seconds = RichText(
  text: TextSpan(
    text: '27\t',
    style: TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(190, 129, 248, 0.7),
    ),
    children: <TextSpan>[
      TextSpan(
          text: 'S',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            fontSize: 40,
          )),
    ],
  ),
  textAlign: TextAlign.center,
);
