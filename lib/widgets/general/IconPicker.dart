import 'package:countdown_app/widgets/buttons/SmallButton.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class IconPicker extends StatefulWidget {
  final ValueChanged<int> onIconChanged;
  IconPicker({Key? key, required this.onIconChanged}) : super(key: key);

  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  int icon = Icons.all_inclusive_outlined.codePoint;

  void _selectIcon() async {
    int? newIcon;
    await showDialog<int>(
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

    if (newIcon != null && newIcon != icon) {
      setState(() {
        icon = newIcon!;
        widget.onIconChanged(icon);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 20),
          child: SmallButton(_selectIcon, "Select Icon"),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Icon(IconData(icon, fontFamily: 'MaterialIcons')),
        ),
      ],
    );
  }
}
