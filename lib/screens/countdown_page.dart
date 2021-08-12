import 'package:flutter/material.dart';
// import 'package:countdown_app/widgets/event/count_down.dart';
import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/widgets/event/event.dart';

class CountDownPage extends StatelessWidget {
  final Event event;

  CountDownPage(this.event);

  Widget counter(String num, String unit) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: '$num\t',
        style: TextStyle(
          fontSize: 80,
          color: whiteTextColor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: unit,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 40,
              )),
        ],
      ),
    );
  }

  Widget counterblock(String num, String unit) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40, left: 50),
      child: counter(num, unit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        label: Text('RETURN', style: TextStyle(color: Color(event.color))),
        backgroundColor: lighterBlackOne,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            counterblock('20', 'D'),
            counterblock('04', 'H'),
            counterblock('08', 'M'),
            counterblock('05', 'S'),
            Container(
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Text(
                "Time is the most valuable thing a man can spend. \nOnly 20 days left.",
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: backgroundBlack,
    );
  }
}
