import 'package:flutter/material.dart';
import 'package:countdown_app/constants/constants.dart';

class SimpleCheckBox extends StatefulWidget {
  final ValueChanged<bool>? onCheckChanged;
  final bool? previousChoice;
  SimpleCheckBox({Key? key, this.onCheckChanged, this.previousChoice}) : super(key: key);

  @override
  SimpleCheckBoxState createState() => SimpleCheckBoxState();
}

class SimpleCheckBoxState extends State<SimpleCheckBox> {
  bool selectedChoice = false;

  @override
  Widget build(BuildContext context) {
    if (widget.previousChoice != null) {
      selectedChoice = widget.previousChoice!;
    }
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text(
        'Receive notification',
        style: TextStyle(color: whiteTextColor),
      ),
      trailing: Checkbox(
        activeColor: lighterBlackOne,
        checkColor: onSurfaceWhite,
        value: selectedChoice,
        onChanged: (value) {
          setState(() {
            selectedChoice = value!;
            widget.onCheckChanged!(selectedChoice);
          });
        },
      ),
    );
  }
}
