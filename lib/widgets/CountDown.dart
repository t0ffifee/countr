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
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 259200;

  // TODO idk of deze initstate nodig is, volgens mij namelijk niet
  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(
        endTime: widget.event.eDate.millisecondsSinceEpoch, onEnd: onEnd);
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        // hier moeten we de DateTime doorgeven van het einde van de event
        endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 259200;
        controller.endTime = endTime;
      });
    });
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CountdownTimer(
          // DIT IS ALLES WAT JE HOEFT TE DOEN LOL DITS WORDT GEWELDIG
          endTime: widget.event.eDate.millisecondsSinceEpoch + 482394832,
          widgetBuilder: (_, CurrentRemainingTime time) {
            if (time == null) {
              return Text('Game over');
            }
            return Text(
                'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
          },
        ),
      ),
    );
  }
}
