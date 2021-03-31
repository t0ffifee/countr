import 'package:countdown_app/widgets/general/DatePicker.dart';
import 'package:countdown_app/widgets/general/TimePicker.dart';
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
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
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
    print("[ACTION] Save Button gedrukt");

    DateTime chosenDateAndTime = selectedDate.add(Duration(hours: selectedTime.hour, minutes: selectedTime.minute));

    if (correctChosenTime(chosenDateAndTime)) {
      print("Good Time");
      // createEvent(titleController.text, descriptionController.text, selectedDate, selectedTime);
    } else {
      print("Bad Time");
      SnackBar sb = SnackBar(content: Text("Choose a time that is beyond the current time"));
      ScaffoldMessenger.of(context).showSnackBar(sb);
    }

    // We moeten nu het scherm verlaten
    // Navigator.pop(context);
  }

  void cancelButtonFunction() {
    print("[ACTION] Cancel Button gedrukt");
    Navigator.pop(context);
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
