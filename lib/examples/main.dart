// main.dart
import 'package:flutter/material.dart';
import '../constants/constants.dart';

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
        backgroundColor: backgroundBlack,
      ),
      body: Center(
        child: Container(
            color: backgroundBlack,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                deWidget(
                    context, Colors.deepPurple, 'Italie reis', 'Naar italie gaan want het is daar zo mooi en zo u know', Icons.airplanemode_active),
                Divider(),
                deWidget(context, Colors.cyan, 'Italie reis', 'Naar italie gaan', Icons.airplanemode_active),
                Divider(),
                deWidget(context, Colors.green, 'Italie reis', 'Naar italie gaan', Icons.airplanemode_active),
                Divider(),
                deWidget(context, Colors.orange, 'Italie reis', 'Naar italie gaan', Icons.airplanemode_active),
                Divider(),
                deWidget(context, Colors.red, 'Italie reis', 'Naar italie gaan', Icons.airplanemode_active),
                Divider(),
              ],
            )),
      ),
    );
  }

  Widget deWidget(BuildContext context, Color col, String tit, String dec, IconData icon) {
    return Card(
      elevation: 1,
      color: Color.fromRGBO(29, 29, 29, 0.95),
      // color: Colors.red,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Container(width: 10, height: 200, color: col),
          Expanded(
            child: Column(
              children: <Widget>[
                topBarCard(tit, dec, icon),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: dateShower(['10', '23', '59', '59']),
                ),
                cardButtonBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

// TODO deze dingen hieronder horen duidelijk een eigen class te zijn
  Widget topBarCard(String title, String description, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: onSurfaceWhite,
      ),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: onSurfaceWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        description,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: whiteTextColor),
      ),
    );
  }

  // TODO dit wordt uiteindelijk de CardCountDown widget
  Widget dateShower(List<String> times) {
    return Container(
      // margin: EdgeInsets.only(left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          timePart(times, 0, "DAYS"),
          Container(width: 10),
          timePart(times, 1, "HOURS"),
          Container(width: 10),
          timePart(times, 2, "MINUTES"),
          Container(width: 10),
          timePart(times, 3, "SECONDS"),
        ],
      ),
    );
  }

  Widget timePart(List<String> times, int index, String unit) {
    return RichText(
      text: TextSpan(
        text: times[index],
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: onSurfaceWhite,
        ),
        children: <TextSpan>[
          TextSpan(
              text: ('\n' + unit),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              )),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget cardButtonBar(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        IconButton(
          focusColor: lightPurple,
          splashRadius: splashRadiusIconButtonCard,
          icon: Icon(
            Icons.edit,
            color: onSurfaceWhite,
          ),
          onPressed: () {
            print("Edit Button");
          },
        ),
      ],
    );
  }
}
