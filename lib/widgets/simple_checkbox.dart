import 'package:flutter/material.dart';
import 'package:countdown_app/constants/constants.dart';

class SimpleCheckBox extends StatefulWidget {
  final ValueChanged<bool>? onCheckChanged;
  SimpleCheckBox({Key? key, this.onCheckChanged}) : super(key: key);

  @override
  SimpleCheckBoxState createState() => SimpleCheckBoxState();
}

class SimpleCheckBoxState2 extends State<SimpleCheckBox> {
  bool v = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('Receive notification'),
      value: v,
      onChanged: (value) {
        setState(() {
          v = value!;
          widget.onCheckChanged!(v);
        });
      },
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: Icon(Icons.notifications),
    );
  }
}

class SimpleCheckBoxState extends State<SimpleCheckBox> {
  bool v = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text(
        'Receive notification',
        style: TextStyle(color: whiteTextColor),
      ),
      trailing: Checkbox(
        activeColor: lighterBlackOne,
        checkColor: lightPurple,
        value: v,
        onChanged: (value) {
          setState(() {
            v = value!;
            widget.onCheckChanged!(v);
          });
        },
      ),
    );
  }
}
