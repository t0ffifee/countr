import 'package:countdown_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:countdown_app/widgets/event/event.dart';
import 'dart:async';

class EventProgress extends StatefulWidget {
  const EventProgress({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  State<StatefulWidget> createState() {
    return EventProgressState();
  }
}

class EventProgressState extends State<EventProgress> {
  double _progress = 0;

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_progress == 1) {
            timer.cancel();
          } else {
            _progress += 0.2;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LinearProgressIndicator(
          backgroundColor: lighterBlackOne,
          valueColor:
              new AlwaysStoppedAnimation<Color>(Color(widget.event.color)),
          value: _progress,
        ),
        ElevatedButton(
          child: Text('Start timer'),
          onPressed: () {
            setState(() {
              _progress = 0;
            });

            startTimer();
          },
        ),
      ],
    );
  }
}
