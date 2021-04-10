import 'package:flutter/material.dart';

class SquareColor extends StatefulWidget {
  static const double _kColorElevation = 4.0;

  bool isSelected;
  final Color color;
  final double elevation;

  SquareColor({
    this.color,
    this.isSelected = false,
    this.elevation = _kColorElevation,
  });

  @override
  _SquareColorState createState() => _SquareColorState();
}

class _SquareColorState extends State<SquareColor> {
  @override
  Widget build(BuildContext context) {
    final brightness = ThemeData.estimateBrightnessForColor(widget.color);
    final icon = brightness == Brightness.light ? Colors.black : Colors.white;

    return GestureDetector(
      child: Material(
        elevation: widget.elevation ?? SquareColor._kColorElevation,
        shape: const CircleBorder(),
        child: Container(
          child: widget.isSelected ? Icon(Icons.done, color: icon) : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.color,
          ),
          height: 45,
          width: 45,
        ),
      ),
      onTap: () {
        setState(() {
          if (widget.isSelected) {
            widget.isSelected = false;
          } else {
            widget.isSelected = true;
          }
        });
      },
    );
  }
}
