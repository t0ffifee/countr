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
      helpText: "Choose the date of the event",
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.yellow,
        ),
        home: Scaffold(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(31, 31, 31, 1),
            title: Text(
              'Create Page',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Color.fromRGBO(190, 129, 248, 0.8),
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Color.fromRGBO(227, 227, 227, 1),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusColor: Colors.green,
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(143, 143, 143, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Color.fromRGBO(190, 129, 248, 0.8),
                      primaryColorDark: Colors.blue,
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Color.fromRGBO(227, 227, 227, 1),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(143, 143, 143, 1),
                        ),
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
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 170,
                        buttonColor: Color.fromRGBO(50, 50, 50, 1),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: RaisedButton(
                            onPressed: () {
                              print("hai");
                            },
                            child: Text(
                              'Save this',
                              style: TextStyle(
                                color: Color.fromRGBO(143, 143, 143, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 170,
                        buttonColor: Color.fromRGBO(50, 50, 50, 1),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color.fromRGBO(143, 143, 143, 1),
                              ),
                            ),
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
      ),
    );
  }
}
