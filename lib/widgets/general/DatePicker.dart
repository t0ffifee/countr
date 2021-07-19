import 'package:countdown_app/widgets/buttons/SmallButton.dart';
import 'package:flutter/material.dart';

/// Provides a dialog where the user can choose a date
class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onDateTimeChanged;
  DatePicker({Key? key, this.onDateTimeChanged}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  /// Returns the DatePickerDialog in which the user can choose the date
  void _selectDate() async {
    const int FiveYears = 365 * 5;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: FiveYears)),
      helpText: "Choose the date of the event",
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        widget.onDateTimeChanged!(selectedDate);
        print('Date selected: ${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 20),
          child: SmallButton(_selectDate, "Select Date"),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}",
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
