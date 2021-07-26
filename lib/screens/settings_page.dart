import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.yellow,
        ),
        home: Scaffold(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(31, 31, 31, 1),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[Text("Settings")],
            ),
          ),
        ),
      ),
    );
  }
}
