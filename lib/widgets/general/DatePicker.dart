import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateTimeChanged;
  DatePicker({Key key, this.onDateTimeChanged}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  bool _decideWhichDayToEnable(DateTime day) {
    const FiveYears = 365 * 5;
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) && day.isBefore(DateTime.now().add(Duration(days: FiveYears))))) {
      return true;
    }
    return false;
  }

  void _selectDate() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year), // Dit jaar
      lastDate: DateTime(2025),
      selectableDayPredicate: _decideWhichDayToEnable,
      helpText: "Choose the date of the event",
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        widget.onDateTimeChanged(selectedDate);
        print('Date selected: ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 20),
          child: ElevatedButton(
            onPressed: _selectDate,
            child: Text(
              'Select date',
              style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            // color: Color.fromRGBO(50, 50, 50, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
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
