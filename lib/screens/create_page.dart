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

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundBlack,
          // AppBar kan eigen widget zijn
          appBar: AppBar(
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
          ),
          body: Center(child: Container()),
        ),
      ),
    );
  }
}

// class CreatePagee extends StatefulWidget {
//   @override
//   _CreatePageeState createState() => _CreatePageeState();
// }

// class _CreatePageeState extends State<CreatePagee> {
//   DateTime selectedDate = DateTime.now().subtract(Duration(
//     hours: TimeOfDay.now().hour,
//     minutes: TimeOfDay.now().minute,
//   ));
//   TimeOfDay selectedTime = TimeOfDay(hour: 6, minute: 30);
//   bool pushNotification = false;
//   int chosenIconPoint = 0;
//   int chosenColor = 0xff9c27b0;

//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);

//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       },
//       child: MaterialApp(
//         theme: ThemeData(
//           brightness: Brightness.dark,
//         ),
//         home: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: backgroundBlack,
//           appBar: AppBar(
//             centerTitle: true,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 print("Return");
//                 Navigator.pop(context);
//               },
//             ),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.done),
//                 onPressed: () {
//                   print("Done");
//                 },
//               )
//             ],
//             backgroundColor: lighterBlackOne,
//             title: Text(
//               'Create Event',
//               style: TextStyle(color: onSurfaceWhite),
//             ),
//           ),
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 TextInput(titleController, "Title"),
//                 TextInput(descriptionController, "Description"),
//                 Container(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: DatePicker(
//                     onDateTimeChanged: (newDateTime) {
//                       selectedDate = newDateTime;
//                     },
//                   ),
//                 ),
//                 Container(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: TimePicker(
//                     onTimeChanged: (newTimeOfDay) {
//                       selectedTime = newTimeOfDay;
//                     },
//                   ),
//                 ),
//                 Container(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: IconPicker(
//                     onIconChanged: (newIcon) {
//                       chosenIconPoint = newIcon;
//                     },
//                   ),
//                 ),
//                 Container(
//                   alignment: AlignmentDirectional.topCenter,
//                   child: colorPicker(),
//                 ),
//                 Container(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: notificationSwitch(),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 15, right: 20),
//                   child: SmallButton(saveButtonFunction, "Save this"),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget colorPicker() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
//       child: Column(
//         children: [
//           Container(
//             // alignment: AlignmentDirectional,
//             width: double.infinity,
//             height: 55,
//             child: MyColorPicker(
//                 onSelectColor: (value) {
//                   print(value);
//                 },
//                 availableColors: [
//                   Colors.blue.shade300,
//                   Colors.green.shade300,
//                   Colors.red.shade300,
//                   Colors.purple.shade300,
//                   Colors.teal.shade300,
//                 ],
//                 initialColor: Colors.blue.shade300),
//           )
//         ],
//       ),
//     );
//   }

//   Widget notificationSwitch() {
//     return ListTile(
//       title: Text("Push Notification"),
//       leading: Switch(
//         value: pushNotification,
//         activeColor: lightPurple,
//         onChanged: (value) {
//           setState(() {
//             pushNotification = value;
//           });
//         },
//       ),
//     );
//   }

//   bool correctChosenTime(DateTime dt) {
//     DateTime now = DateTime.now();
//     int minuteDif = dt.difference(now).inMinutes;
//     print("minuteDif $minuteDif");
//     if (minuteDif > 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void createEvent(DateTime eventDate, String title, String description, int iconDataPoint, int colorCode, bool notification) {
//     Event event = new Event(eventDate, title, description, iconDataPoint, colorCode, notification);
//     event.saveEvent();
//   }

//   void saveButtonFunction() {
//     DateTime chosenDateAndTime = selectedDate.add(Duration(hours: selectedTime.hour, minutes: selectedTime.minute));
//     if (correctChosenTime(chosenDateAndTime)) {
//       String title = titleController.text;
//       String description = descriptionController.text;

//       createEvent(chosenDateAndTime, title, description, chosenIconPoint, chosenColor, pushNotification);
//       Navigator.pop(context);
//     } else {
//       showErrorDialog();
//     }
//   }

//   void showErrorDialog() {
//     showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Chosen impossible time'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Choose a time that is beyond the current time'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Approve'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
