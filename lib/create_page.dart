import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  DateTime selectedDate = DateTime.now();

  bool _decideWhichDayToEnable(DateTime day) {
    const FiveYears = 365 * 5;
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: FiveYears))))) {
      return true;
    }
    return false;
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Create Page'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.purpleAccent,
                    primaryColorDark: Colors.purple,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      labelText: 'Title',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 20),
                    child: RaisedButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        'Select date',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.greenAccent,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 170,
                      buttonColor: Colors.grey,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: RaisedButton(
                          onPressed: null,
                          child: Text('Save'),
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 170,
                      buttonColor: Colors.grey,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
