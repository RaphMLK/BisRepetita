import 'package:bisrepetita/theme/bp_buttom_theme.dart';
import 'package:bisrepetita/theme/bp_text_theme.dart';
import 'package:flutter/material.dart';

class BPAppTheme {
  static ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    filledButtonTheme: BPButtonTheme.defaultFilledThemeButton,
    textTheme: BPTextTheme.defaultTextTheme,
  );
}
