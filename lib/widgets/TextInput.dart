// Dit is volgens mij hoe je alleen staande widgets maakt iguess
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String name;

  // TODO zoek uit of je required of niet moet gebruiken (volgens mij is required echt alleen voor jezelf)
  const TextInput(this.controller, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      child: Theme(
        data: ThemeData(
          primaryColor: Color.fromRGBO(190, 129, 248, 0.8),
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(
            color: Color.fromRGBO(227, 227, 227, 1),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: name,
            labelStyle: TextStyle(
              color: Color.fromRGBO(143, 143, 143, 1),
            ),
          ),
        ),
      ),
    );
  }
}
