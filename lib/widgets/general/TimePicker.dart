import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onTimeChanged;
  TimePicker({Key key, this.onTimeChanged}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay time = TimeOfDay(hour: 6, minute: 15);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (newTime != null) {
      setState(() {
        time = newTime;
        widget.onTimeChanged(newTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 20),
          child: ElevatedButton(
            onPressed: () => _selectTime(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                  color: onSurfaceWhite,
                ),
              ),
            ),
            child: Text(
              'Select time',
            ),
            // color: Color.fromRGBO(50, 50, 50, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "${time.hour}:${time.minute}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
