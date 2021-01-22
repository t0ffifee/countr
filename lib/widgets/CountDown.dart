import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountDown extends StatefulWidget {
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  CountdownTimerController controller;
  // hier moeten we de DateTime doorgeven van het einde van de event
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 259200;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
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
    return Container(
      child: throw UnimplementedError,
    );
  }
}
