import 'package:countdown_app/widgets/general/DatePicker.dart';
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

  void createEvent(String title, String description, DateTime eventDate) {
    int iconDataPoint = Icons.person.codePoint;
    Event event = new Event(eventDate, title, description, iconDataPoint);
    event.saveEvent();
  }

  void saveButtonFunction() {
    print("[ACTION] Save Button gedrukt");
    createEvent(titleController.text, descriptionController.text, selectedDate);

    // SnackBar sb = SnackBar(content: Text("Event Is Saved"));
    // Scaffold.of(context).showSnackBar(sb);

    // We moeten nu het scherm verlaten
    // Navigator.pop(context);
  }

  void cancelButtonFunction() {
    print("[ACTION] Cancel Button gedrukt");
    Navigator.pop(context);
  }
}
