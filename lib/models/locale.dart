import 'package:flutter/cupertino.dart';

class BPLocale extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  set locale(Locale? locale) {
    _locale = locale;
    notifyListeners();
  }
}
