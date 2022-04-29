import 'package:flutter/material.dart';

class colors {
  Color currentColor;
  colors(this.currentColor);

  List<Color> currentColors = [];

  void changeColor(Color color) {
    currentColor = color;
  }
}
