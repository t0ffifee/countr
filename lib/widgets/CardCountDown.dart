import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import '../constants/constants.dart';
import 'Event.dart';

class CardCountDown extends StatefulWidget {
  final Event event;

  CardCountDown(this.event);

  @override
  _CardCountDownState createState() => _CardCountDownState();
}

class _CardCountDownState extends State<CardCountDown> {
  CountdownTimerController controller;

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: widget.event.eDate.millisecondsSinceEpoch,
      widgetBuilder: (controller, CurrentRemainingTime time) {
        if (time == null) {
          // TODO hier kunnen we allemaal functionaliteit toevoegen
          return Text('Game over');
        }
        return fullCounter(time);
      },
    );
  }
}

Widget fullCounter(CurrentRemainingTime time) => Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          counter(time.days, "DAYS"),
          counter(time.hours, "HOURS"),
          counter(time.min, "MINUTES"),
          counter(time.sec, "SECONDS"),
        ],
      ),
    );

Widget counter(int time, String unit) => RichText(
      text: TextSpan(
        text: "$time",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: whiteTextColor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '\n$unit',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              )),
        ],
      ),
      textAlign: TextAlign.center,
    );
