import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class BPLocale extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  set locale(Locale? locale) {
    _locale = locale;
    notifyListeners();
  }

  String getLocaleShortName() {
    if (_locale == null) {
      return Intl.shortLocale(Intl.getCurrentLocale());
    } else {
      return _locale!.languageCode;
    }
  }
}
