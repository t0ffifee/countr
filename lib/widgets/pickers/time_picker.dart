import 'package:countdown_app/widgets/small_button.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay>? onTimeChanged;
  final TimeOfDay? previousTime;
  TimePicker({Key? key, this.onTimeChanged, this.previousTime}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late TimeOfDay selectedTime;
  @override
  void initState() {
    if (widget.previousTime != null) {
      selectedTime = widget.previousTime!;
    } else {
      selectedTime = TimeOfDay.now();
    }
    super.initState();
  }

  /// Creating a 24 hour time dialog for the user to choose a time
  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
        widget.onTimeChanged!(selectedTime);
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
            "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}",
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
