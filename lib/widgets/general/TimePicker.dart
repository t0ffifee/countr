import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key key}) : super(key: key);

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
          child: RaisedButton(
            onPressed: () => _selectTime(),
            child: Text(
              'Select time',
              style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Color.fromRGBO(50, 50, 50, 1),
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
