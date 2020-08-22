import 'package:countdown_app/create_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purple,
    ),
    title: 'CountDown',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                height: 30,
                color: Color.fromRGBO(7, 7, 7, 1),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.phone_android),
                      trailing: Icon(Icons.edit),
                      title: Text('Card Uno'),
                      subtitle: Text('discription discription discription'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.drag_handle,
                            color: Colors.grey,
                          ),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.directions_car),
                      trailing: Icon(Icons.edit),
                      title: Text('Card Dos'),
                      subtitle: Text('(discription discription discription)'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.drag_handle,
                            color: Colors.grey,
                          ),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                color: Color.fromRGBO(7, 7, 7, 1),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(7, 7, 7, 1),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          splashColor: Colors.purpleAccent,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          child: Container(height: 50.0),
          notchMargin: 5,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => CreatePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.easeInQuart;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
