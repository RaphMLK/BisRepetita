import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:flutter/material.dart';

class BPButtonTheme {
  static final defaultFilledThemeButton = FilledButtonThemeData(
      style: FilledButton.styleFrom(
    minimumSize: Size.fromHeight(40),
    backgroundColor: BPColors.primaryColor,
    disabledBackgroundColor: BPColors.primaryColor,
  ));
}
