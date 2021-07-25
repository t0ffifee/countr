import 'package:flutter/material.dart';

class MyColorPicker extends StatefulWidget {
  final Function onSelectColor; // This function sends the selected color to outside
  // List of pickable colors
  final List<Color> availableColors = [
    Colors.blue.shade300,
    Colors.green.shade300,
    Colors.red.shade300,
    Colors.purple.shade300,
    Colors.teal.shade300,
  ];
  final Color initialColor; // The default picked color

  MyColorPicker({required this.onSelectColor, required this.initialColor});

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // This variable used to determine where the checkmark will be
  late Color _pickedColor;

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
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 50, childAspectRatio: 1 / 1, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          return InkWell(
            borderRadius: BorderRadius.circular(12),
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
