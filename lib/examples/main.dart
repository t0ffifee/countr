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
      title: 'widget freestyle',
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
        title: Text('widget freestyle'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
            color: Colors.black,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                deWidget(context, Colors.blue.shade300),
                Divider(),
                deWidget(context, Colors.red.shade300),
                Divider(),
                deWidget(context, Colors.green.shade300),
                Divider(),
                deWidget(context, Colors.yellow.shade300),
                Divider(),
                deWidget(context, Colors.purple.shade300),
              ],
            )),
      ),
    );
  }

  Widget deWidget(BuildContext context, Color col) {
    return Container(
      height: 170,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: col,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            ),
            width: 20,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 15,
                    child: ClipOval(
                      child: Material(
                        child: InkWell(
                          splashColor: Colors.purple.shade300, // Splash color
                          onTap: () {},
                          child: SizedBox(width: 35, height: 35, child: Icon(Icons.more_vert)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
