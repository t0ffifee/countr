import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/widgets/pickers/color_picker.dart';
import 'package:countdown_app/widgets/pickers/date_picker.dart';
import 'package:countdown_app/widgets/pickers/time_picker.dart';
import 'package:countdown_app/widgets/pickers/icon_picker.dart';
import 'package:countdown_app/widgets/simple_checkbox.dart';
import 'package:flutter/material.dart';

import 'package:countdown_app/widgets/text_input.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => save(),
            icon: Icon(
              Icons.check,
              color: onSurfaceWhite,
            ),
            label: Text(
              "DONE",
              style: TextStyle(color: onSurfaceWhite),
            ),
            backgroundColor: lighterBlackOne,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundBlack,
          appBar: buildPageAppBar(context),
          body: Center(
            child: Column(
              children: [
                TextInput(titleController, 'Title'),
                // TextInput(descriptionController, 'Description'),
                buildDatePicker(selectedDate),
                buildTimePicker(selectedTime),
                buildIconPicker(chosenIconPoint),
                buildColorPicker(),
                buildCheckBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildPageAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundBlack,
      title: Text(
        'Create Event',
        style: TextStyle(color: onSurfaceWhite),
      ),
    );
  }
}

Widget buildDatePicker(DateTime selectedDate) {
  return Container(
    alignment: AlignmentDirectional.centerStart,
    child: DatePicker(
      onDateTimeChanged: (newDateTime) {
        selectedDate = newDateTime;
      },
    ),
  );
}

Widget buildTimePicker(TimeOfDay selectedTime) {
  return Container(
    alignment: AlignmentDirectional.centerStart,
    child: TimePicker(
      onTimeChanged: (newTimeOfDay) {
        selectedTime = newTimeOfDay;
      },
    ),
  );
}

Widget buildIconPicker(int chosenIconPoint) {
  return Container(
    alignment: AlignmentDirectional.centerStart,
    child: IconPicker(
      onIconChanged: (newIcon) {
        chosenIconPoint = newIcon;
      },
    ),
  );
}

Widget buildColorPicker() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
    child: Column(
      children: [
        Container(
          // alignment: AlignmentDirectional,
          width: double.infinity,
          height: 55,
          child: MyColorPicker(
              onSelectColor: (value) {
                print(value);
              },
              initialColor: Colors.blue.shade300),
        )
      ],
    ),
  );
}

Widget buildCheckBox() {
  return SimpleCheckBox(
    onCheckChanged: (newChoice) {
      print(newChoice);
    },
  );
}

void save() {
  print('Save');
}
