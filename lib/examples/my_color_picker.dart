import 'package:flutter/material.dart';

class MyColorPicker extends StatefulWidget {
  final Function onSelectColor; // This function sends the selected color to outside
  final List<Color> availableColors; // List of pickable colors
  final Color initialColor; // The default picked color

  MyColorPicker({@required this.onSelectColor, @required this.availableColors, @required this.initialColor});

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // This variable used to determine where the checkmark will be
  Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 50, childAspectRatio: 1 / 1, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          return InkWell(
            onTap: () {
              widget.onSelectColor(itemColor);
              setState(() {
                _pickedColor = itemColor;
              });
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: itemColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey[300]),
              ),
              child: itemColor == _pickedColor
                  ? Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
            ),
          );
        },
      ),
    );
  }
}
