import 'package:countdown_app/widgets/small_button.dart';
import 'package:flutter/material.dart';

/// Provides a dialog where the user can choose a date
class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onDateTimeChanged;
  final DateTime? previousDate;
  DatePicker({Key? key, this.onDateTimeChanged, this.previousDate}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime selectedDate;
  @override
  void initState() {
    if (widget.previousDate != null) {
      selectedDate = widget.previousDate!;
    } else {
      selectedDate = DateTime.now();
    }
    super.initState();
  }

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
    if (picked != null)
      setState(() {
        selectedDate = picked;
        widget.onDateTimeChanged!(selectedDate);
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
