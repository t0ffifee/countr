import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/widgets/color_picker/ColorPicker.dart';
import 'package:countdown_app/widgets/general/DatePicker.dart';
import 'package:countdown_app/widgets/general/TimePicker.dart';
import 'package:countdown_app/widgets/general/IconPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/Event.dart';
import '../widgets/TextInput.dart';
import '../widgets/buttons/SmallButton.dart';

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
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundBlack,
          appBar: createPageAppBar(context),
          body: Center(
            child: Column(
              children: [
                TextInput(titleController, 'Title'),
                TextInput(descriptionController, 'Description'),
                DatePicker(
                  onDateTimeChanged: (newDateTime) {
                    selectedDate = newDateTime;
                  },
                ),
                SimpleNotificationSwitch(
                  onSwitchChanged: (newSwitch) {
                    print(newSwitch);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar createPageAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          print("Return");
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.done),
          onPressed: () {
            print("Done");
          },
        )
      ],
      backgroundColor: lighterBlackOne,
      title: Text(
        'Create Event',
        style: TextStyle(color: onSurfaceWhite),
      ),
    );
  }
}

class SimpleNotificationSwitch extends StatefulWidget {
  final ValueChanged<bool>? onSwitchChanged;
  SimpleNotificationSwitch({Key? key, this.onSwitchChanged}) : super(key: key);

  @override
  SimpleNotificationSwitchState createState() => SimpleNotificationSwitchState();
}

class SimpleNotificationSwitchState extends State<SimpleNotificationSwitch> {
  bool v = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Push Notification"),
      leading: Switch(
        value: v,
        activeColor: lightPurple,
        onChanged: (value) {
          setState(() {
            v = value;
            widget.onSwitchChanged!(v);
          });
        },
      ),
    );
  }
}
