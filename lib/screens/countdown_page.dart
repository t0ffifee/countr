import 'package:flutter/material.dart';

Color lightPurple = Color.fromRGBO(190, 129, 248, 1);
Color backgroundBlack = Color.fromRGBO(18, 18, 18, 1);
Color lighterBlackOne = Color.fromRGBO(41, 41, 41, 1);
Color whiteTextColor = Color.fromRGBO(143, 143, 143, 1);

class SecondRoute extends StatelessWidget {
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
            Container(height: 20),
            RichText(
              text: TextSpan(
                text: '5\t',
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
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                      )),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Container(height: 20),
            hours,
            Container(height: 20),
            minutes,
            Container(height: 20),
            seconds,
            Container(height: 180),
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
