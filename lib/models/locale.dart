import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class BPLocale extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale {
    _locale ??= Locale(Platform.localeName);
    return _locale;
  }

  set locale(Locale? locale) {
    _locale = locale;
    notifyListeners();
  }

  String getLocaleShortName() {
    return Intl.shortLocale(locale!.languageCode);
  }
}
