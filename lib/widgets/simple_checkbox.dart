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
  late bool selectedChoice;

  @override
  void initState() {
    if (widget.previousChoice != null) {
      selectedChoice = widget.previousChoice!;
    } else {
      selectedChoice = false;
    }
    super.initState();
  }

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
