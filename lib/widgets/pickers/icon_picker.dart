import 'package:countdown_app/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:countdown_app/constants/constants.dart';

class IconPicker extends StatefulWidget {
  final ValueChanged<int>? onIconChanged;
  final int? previousIcon;
  IconPicker({Key? key, this.onIconChanged, this.previousIcon}) : super(key: key);

  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  // The general icon for any event (infinity sign)
  int selectedIcon = Icons.alarm.codePoint;

  /// Makes a dialog of the 16 Icons so the user can choose one
  void _selectIcon() async {
    int? newIcon;
    await showDialog<int>(
      context: context,
      barrierDismissible: true,
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
                      Navigator.pop(context);
                      newIcon = iconList[i].codePoint;
                    },
                  )
              ],
            ),
          ),
        );
      },
    );

    if (newIcon != null && newIcon != selectedIcon) {
      setState(() {
        selectedIcon = newIcon!;
        widget.onIconChanged!(selectedIcon);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.previousIcon != null) {
      selectedIcon = widget.previousIcon!;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 20),
          child: SmallButton(_selectIcon, "Select Icon"),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Icon(IconData(selectedIcon, fontFamily: 'MaterialIcons')),
        ),
      ],
    );
  }
}
