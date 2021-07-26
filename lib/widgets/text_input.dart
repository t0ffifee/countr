import 'package:flutter/material.dart';
import 'package:countdown_app/constants/constants.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String name;

  const TextInput(this.controller, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      child: TextField(
        cursorColor: lightPurple,
        controller: controller,
        style: TextStyle(
          color: whiteTextColor,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: lightPurple)),
          filled: true,
          fillColor: lighterBlackOne,
          border: OutlineInputBorder(),
          labelText: name,
          labelStyle: TextStyle(
            color: whiteTextColor,
          ),
        ),
      ),
    );
  }
}
