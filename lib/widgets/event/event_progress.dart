import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/widgets/event/event.dart';
import 'package:flutter/material.dart';

class EventProgress extends StatefulWidget {
  const EventProgress({Key? key, required this.event, required this.height, required this.width}) : super(key: key);
  final Event event;
  final double height;
  final double width;

  @override
  _EventProgressState createState() => _EventProgressState();
}

class _EventProgressState extends State<EventProgress> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 50), // resterende seconden tot event
    )..addListener(() {
        setState(() {});
      });
    controller.value = 0; // ((now.epoch-creation.epoch)/(event.epoch-creation.epoch))
    controller.animateTo(1);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        height: widget.height,
        width: widget.width,
        child: LinearProgressIndicator(
          value: controller.value,
          color: Color(widget.event.eColor),
          backgroundColor: lighterBlackOne,
          semanticsLabel: 'Linear progress indicator',
        ),
      ),
    );
  }
}
