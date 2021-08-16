import 'package:countdown_app/widgets/event/event_progress.dart';
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
      // width: double.infinity,
      margin: EdgeInsets.only(top: 40, left: 40),
      child: counter(num, unit),
    );
  }

  Widget textfill() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 30),
      child: Text(
        "Time is the most valuable thing a man can spend. \nOnly 20 days left.",
        style: TextStyle(
          color: whiteTextColor,
          fontSize: 30,
        ),
      ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40, left: 10),
              child: ListTile(
                leading: Icon(
                  IconData(event.eIconCodePoint, fontFamily: 'MaterialIcons'),
                  color: whiteTextColor,
                ),
                title: Text(
                  event.eTitle,
                  style: TextStyle(color: whiteTextColor, fontSize: 24),
                ),
                trailing: Icon(
                  Icons.fiber_manual_record_outlined,
                  color: Color(event.eColor),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: EventProgress(event: event),
                ),
                Container(
                  height: 536,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      counterblock('20', 'D'),
                      counterblock('04', 'H'),
                      counterblock('08', 'M'),
                      counterblock('05', 'S'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: backgroundBlack,
    );
  }
}
