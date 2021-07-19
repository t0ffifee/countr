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
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Container(
            width: 10,
            height: 200,
            color: col,
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Card title 1'),
                  subtitle: Text(
                    'Secondary Text',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 1'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
