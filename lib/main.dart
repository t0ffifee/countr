// import 'package:countdown_app/countdown_page.dart';
import 'package:countdown_app/countdown_page.dart';
import 'package:countdown_app/create_page.dart';
import 'package:flutter/material.dart';
import 'package:countdown_app/fancy_fab.dart';

// Dit moet even in een apart bestand gedaan worden volgens mij met CONSTANTS
Color ligthPurple = Color.fromRGBO(190, 129, 248, 1);
Color backgroundBlack = Color.fromRGBO(18, 18, 18, 1);
Color lighterBlackOne = Color.fromRGBO(41, 41, 41, 1);
Color whiteTextColor = Color.fromRGBO(143, 143, 143, 1);

// TODO check het heroTag probleem, heeft iets te maken met de meerdere FABs in de mega FAB
// TODO maak aparte widget files voor belangrijke widgets die je vaak gebruikt of groot zijn
// TODO misschien een library gebruiken voor het uitvoeren van de multi-FAB

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green,
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
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              topContainer,
              getCard(context),
              bottomContainer,
            ],
          ),
        ),
        backgroundColor: backgroundBlack,
        floatingActionButton: FancyFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

Container topContainer = Container(
  height: 30,
  color: Color.fromRGBO(18, 18, 18, 1),
);

Container bottomContainer = Container(
  height: 70,
  color: Color.fromRGBO(18, 18, 18, 1),
);

// FloatingActionButton fab(BuildContext context) {
//   return FloatingActionButton(
//     heroTag: 'notUsed',
//     backgroundColor: Color.fromRGBO(190, 129, 248, 1),
//     splashColor: Colors.purpleAccent,
//     child: Icon(Icons.add),
//     onPressed: () {
//       Navigator.of(context).push(_createRoute());
//     },
//   );
// }

Card getCard(BuildContext context) {
  return Card(
    color: Color.fromRGBO(40, 40, 40, 1),
    child: InkWell(
      splashColor: Color.fromRGBO(190, 129, 248, 1),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.directions_car,
              color: Color.fromRGBO(143, 143, 143, 1),
            ),
            title: Text(
              'Perlarmo memoro',
              style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Lorem ipsum dolor sit amet',
              style: TextStyle(color: Color.fromRGBO(143, 143, 143, 1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: '3',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: whiteTextColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\nDAYS',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  text: TextSpan(
                    text: '4',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: whiteTextColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\nHOURS',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  text: TextSpan(
                    text: '20',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: whiteTextColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\nMINUTES',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  text: TextSpan(
                    text: '27',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: whiteTextColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\nSECONDS',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                splashColor: ligthPurple.withAlpha(150),
                onPressed: () {
                  print("Edit button");
                },
                child: Icon(
                  Icons.edit,
                  color: whiteTextColor,
                ),
              ),
              FlatButton(
                splashColor: ligthPurple.withAlpha(150),
                child: Icon(
                  Icons.drag_handle,
                  color: whiteTextColor,
                ),
                onPressed: () {
                  print("Move button");
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => CreatePage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var begin = Offset(0.0, 1.0);
//       var end = Offset.zero;
//       var curve = Curves.easeOut;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
