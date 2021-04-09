import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/widgets/general/DatePicker.dart';
import 'package:countdown_app/widgets/general/TimePicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/Event.dart';
import '../widgets/TextInput.dart';
import '../widgets/buttons/SmallButton.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 23, minute: 59); // dit is slecht maar voor nu kan ik geen oplossing vinden lol
  bool pushNotification = false;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // TODO breng dit naar constants
  List<IconData> iconList = [
    Icons.alarm,
    Icons.house,
    Icons.palette_outlined,
    Icons.airplanemode_active,
    Icons.beach_access,
    Icons.cake,
    Icons.sports_esports,
    Icons.all_inclusive,
    Icons.bedtime,
    Icons.star_outlined,
    Icons.computer,
    Icons.directions_bike,
    Icons.directions_car,
    Icons.directions_boat,
    Icons.directions_train,
    Icons.emoji_events
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.yellow,
        ),
        home: Scaffold(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(31, 31, 31, 1),
            title: Text(
              'Create Event',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                TextInput(titleController, "Title"),
                TextInput(descriptionController, "Description"),
                DatePicker(
                  onDateTimeChanged: (newDateTime) {
                    selectedDate = newDateTime;
                  },
                ),
                TimePicker(
                  onTimeChanged: (newTimeOfDay) {
                    selectedTime = newTimeOfDay;
                  },
                ),
                ListTile(
                  title: Text("Push notification"),
                  leading: Switch(
                    value: pushNotification,
                    activeColor: lightPurple,
                    onChanged: (value) {
                      setState(() {
                        pushNotification = value;
                      });
                    },
                  ),
                ),
                SmallButton(iconFunc, "Choose Icon"),
                SmallButton(colorFunc, "Choose Color"),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SmallButton(saveButtonFunction, "Save this"),
                      SmallButton(cancelButtonFunction, "Cancel"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void iconFunc() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user does not have to tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Icon\n'),
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 8,
            height: 300,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                for (int i = 0; i < 16; i++)
                  IconButton(
                    icon: Icon(iconList[i]),
                    onPressed: () {
                      print(i);
                      Navigator.pop(context);
                    },
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  void colorFunc() {
    // Deze variabelen horen hier niet en deze shit moet echt eens opgeschoond worden allemaal
    ColorSwatch _tempMainColor;
    ColorSwatch _mainColor = Colors.blue;

    MaterialColorPicker mcp = MaterialColorPicker(
      selectedColor: _mainColor,
      allowShades: false,
      onMainColorChange: (color) => setState(() => _tempMainColor = color),
    );

    showDialog<void>(
      context: context,
      barrierDismissible: true, // user does not have to tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Color\n'),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 250,
            child: mcp,
          ),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
              },
            ),
          ],
        );
      },
    );
  }

  void createEvent(String title, String description, DateTime eventDate, TimeOfDay eventTime) {
    int iconDataPoint = Icons.person.codePoint;
    Event event = new Event(eventDate, title, description, iconDataPoint);
    event.saveEvent();
  }

  bool correctChosenTime(DateTime dt) {
    DateTime now = DateTime.now();

    print("[DATETIME CHOSEN] ${dt.month} ${dt.day} ${dt.hour} ${dt.minute}");
    print("[DATETIME NOW] ${now.month} ${now.day} ${now.hour} ${now.minute}");

    int minuteDif = dt.difference(now).inMinutes;
    print("minuteDif $minuteDif");
    if (minuteDif > 0) {
      return true;
    } else {
      return false;
    }
  }

  void saveButtonFunction() {
    DateTime chosenDateAndTime = selectedDate.add(Duration(hours: selectedTime.hour, minutes: selectedTime.minute));

    if (correctChosenTime(chosenDateAndTime)) {
      // createEvent(titleController.text, descriptionController.text, selectedDate, selectedTime);

      // Scherm verlaten
      Navigator.pop(context);
    } else {
      showMyDialog();
    }
  }

  void cancelButtonFunction() {
    Navigator.pop(context);
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chosen impossible time'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Choose a time that is beyond the current time'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class IconChooser extends StatelessWidget {
  const IconChooser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: throw UnimplementedError,
    );
  }
}
