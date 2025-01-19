import 'package:flutter/material.dart';

class CustomColorsScheme extends ColorScheme {

  static const Color myBackgroundColor1 = Color(0xFF19535F);
  static const Color myBackgroundColor2 = Color(0xFF0B7A75);
  static const Color myTertiaryColor = Color(0xFF816E94);
  static const Color myDangerColor = Color(0xFF7B2D26);

  CustomColorsScheme({required super.brightness, required super.primary, required super.onPrimary, required super.secondary, required super.onSecondary, required super.error, required super.onError, required super.surface, required super.onSurface});

}