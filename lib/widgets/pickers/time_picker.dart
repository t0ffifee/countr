import 'package:countdown_app/widgets/small_button.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay>? onTimeChanged;
  TimePicker({Key? key, this.onTimeChanged}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  // TODO check of dit mag gezien de standaard datum vandaag is dus dan zou het voor 6h15 moeten zijn
  TimeOfDay time = TimeOfDay(hour: 6, minute: 15);

  /// Creating a 24 hour time dialog for the user to choose a time
  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      setState(() {
        time = newTime;
        widget.onTimeChanged!(newTime);
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
          child: SmallButton(_selectTime, "Select Time"),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
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
