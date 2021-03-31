import 'package:flutter/material.dart';
// import '../../constants/constants.dart';

class SmallButton extends StatelessWidget {
  final Function buttonFunction;
  final String buttonText;

  SmallButton(this.buttonFunction, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 170,
      buttonColor: Color.fromRGBO(50, 50, 50, 1),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ElevatedButton(
          onPressed: buttonFunction,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Color.fromRGBO(143, 143, 143, 1),
            ),
          ),
        ),
      ),
    );
  }
}

saveButton() {}
