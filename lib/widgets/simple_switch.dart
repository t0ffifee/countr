import 'package:flutter/material.dart';
import 'package:countdown_app/constants/constants.dart';

class SimpleSwitch extends StatefulWidget {
  final ValueChanged<bool>? onSwitchChanged;
  SimpleSwitch({Key? key, this.onSwitchChanged}) : super(key: key);

  @override
  SimpleSwitchState createState() => SimpleSwitchState();
}

class SimpleSwitchState extends State<SimpleSwitch> {
  bool v = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Push Notification"),
      leading: Switch(
        value: v,
        activeColor: lightPurple,
        onChanged: (value) {
          setState(() {
            v = value;
            widget.onSwitchChanged!(v);
          });
        },
      ),
    );
  }
}
