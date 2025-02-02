import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations? getAppLocalizations(BuildContext context) {
  return AppLocalizations.of(context);
}

List<T> randomItemsInList<T>(List<T> list, int nb) {
  return (list.toList()..shuffle()).take(nb).toList();
}
