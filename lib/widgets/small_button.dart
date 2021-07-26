import 'package:flutter/material.dart';
import '../constants/constants.dart';
// import '../../constants/constants.dart';

class SmallButton extends StatelessWidget {
  final Function buttonFunction;
  final String buttonText;

  SmallButton(this.buttonFunction, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: Container(
        child: SizedBox(
          width: 140,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(lighterBlackOne),
              textStyle: MaterialStateProperty.all(TextStyle(color: onSurfaceWhite)),
            ),
            onPressed: () => buttonFunction(),
            child: Text(
              buttonText,
            ),
          ),
        ),
      ),
    );
  }
}
