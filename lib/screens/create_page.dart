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
  DateTime selectedDate = DateTime.now().subtract(Duration(
    hours: TimeOfDay.now().hour,
    minutes: TimeOfDay.now().minute,
  ));
  TimeOfDay selectedTime = TimeOfDay(hour: 6, minute: 30);
  bool pushNotification = false;
  int chosenIconPoint = 0;
  int chosenColor = 0xff9c27b0;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

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
        ),
        home: Scaffold(
          backgroundColor: backgroundBlack,
          appBar: AppBar(
            backgroundColor: lighterBlackOne,
            title: Text(
              'Create Event',
              style: TextStyle(color: onSurfaceWhite),
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
                SmallButton(iconFunc, "Choose Icon"),
                SmallButton(colorFunc, "Choose Color"),
                notificationSwitch(),
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

  Widget notificationSwitch() {
    return ListTile(
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
                      chosenIconPoint = iconList[i].codePoint;
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
    ColorSwatch _mainColor = Colors.purple;

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
                setState(() => _mainColor = _tempMainColor); // TODO is dit wel nodig nu?
                chosenColor = _mainColor.hashCode;
              },
            ),
          ],
        );
      },
    );
  }

  bool correctChosenTime(DateTime dt) {
    DateTime now = DateTime.now();
    int minuteDif = dt.difference(now).inMinutes;
    print("minuteDif $minuteDif");
    if (minuteDif > 0) {
      return true;
    } else {
      return false;
    }
  }

  void createEvent(DateTime eventDate, String title, String description, int iconDataPoint, int colorCode, bool notification) {
    Event event = new Event(eventDate, title, description, iconDataPoint, colorCode, notification);
    event.saveEvent();
  }

  void saveButtonFunction() {
    DateTime chosenDateAndTime = selectedDate.add(Duration(hours: selectedTime.hour, minutes: selectedTime.minute));
    if (correctChosenTime(chosenDateAndTime)) {
      String title = titleController.text;
      String description = descriptionController.text;

      createEvent(chosenDateAndTime, title, description, chosenIconPoint, chosenColor, pushNotification);
      Navigator.pop(context);
    } else {
      showErrorDialog();
    }
  }

  void cancelButtonFunction() {
    Navigator.pop(context);
  }

  void showErrorDialog() {
    showDialog<void>(
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
