import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'Event.dart';

class CountDown extends StatefulWidget {
  final Event event;

  CountDown(this.event);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  CountdownTimerController controller;
  // hier moeten we de DateTime doorgeven van het einde van de event
  int endTime;

  // TODO misschien is het beter om met initState() en onEnd() te werken voor als de event afgelopen is
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
    return CountdownTimer(
      // DIT IS ALLES WAT JE HOEFT TE DOEN LOL DITS WORDT GEWELDIG
      endTime: widget.event.eDate.millisecondsSinceEpoch,
      widgetBuilder: (controller, CurrentRemainingTime time) {
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
