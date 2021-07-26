import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'event.dart';

class CountDown extends StatefulWidget {
  final Event event;

  CountDown(this.event);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late CountdownTimerController controller;
  // hier moeten we de DateTime doorgeven van het einde van de event
  late int endTime;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = CountdownTimerController(endTime: widget.event.eDate.microsecondsSinceEpoch, onEnd: onEnd);
  //   Future.delayed(Duration(seconds: 5), () {
  //     setState(() {
  //       // hier moeten we de DateTime doorgeven van het einde van de event
  //       endTime = widget.event.eDate.microsecondsSinceEpoch;
  //       controller.endTime = widget.event.eDate.microsecondsSinceEpoch;
  //     });
  //   });
  // }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    // const int MillisecondsInMinute = 60 * 1000;
    // const int MillisecondsInHour = 60 * MillisecondsInMinute;
    int days = widget.event.eDate.millisecondsSinceEpoch;
    // int hours = MillisecondsInHour * widget.event.eTime.hour;
    // int minutes = MillisecondsInMinute * widget.event.eTime.hour;
    return CountdownTimer(
      endTime: days, //+ hours + minutes,
      widgetBuilder: (controller, CurrentRemainingTime? time) {
        if (time == null) {
          return Text('Game over');
        }
        return Text(
          'days: [ ${time.days} ] \nhours: [ ${time.hours} ]\nmin: [ ${time.min} ]\nsec: [ ${time.sec} ]',
          style: TextStyle(color: Colors.white, fontSize: 70),
        );
      },
    );
  }
}
