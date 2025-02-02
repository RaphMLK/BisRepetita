import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_symbols_icons/symbols.dart';

AppLocalizations? getAppLocalizations(BuildContext context) {
  return AppLocalizations.of(context);
}

List<T> randomItemsInList<T>(List<T> list, int nb) {
  return (list.toList()..shuffle()).take(nb).toList();
}

final stringToIcon = <String, IconData>{
  "sports_esports": Icons.sports_esports,
  "flare": Icons.flare,
  "location_city": Icons.location_city,
  "skillet": Symbols.skillet,
  "domino_mask": Symbols.domino_mask,
};
