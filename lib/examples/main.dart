// main.dart
import 'package:flutter/material.dart';
import './my_color_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: _color,
          ),
          SizedBox(height: 30),
          MyColorPicker(
              onSelectColor: (value) {
                setState(() {
                  _color = value;
                });
              },
              availableColors: [
                Colors.blue,
                Colors.green,
                Colors.red,
                Colors.purple,
                Colors.teal,
              ],
              initialColor: Colors.blue)
        ],
      ),
    );
  }
}
