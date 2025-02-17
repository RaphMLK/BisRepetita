import 'package:bisrepetita/models/locale.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BPLanguageSelect extends StatelessWidget {
  const BPLanguageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BPLocale>(builder: (context, bpLocale, child) {
      var currentLocale = AvailableLocale.values
          .where((locale) => locale.fromIntl == bpLocale.getLocaleShortName())
          .first;
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: false,
              showDragHandle: true,
              builder: (context) => Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final locale in AvailableLocale.values)
                        ListTile(
                          title: Text(locale.name),
                          leading: Radio<AvailableLocale>(
                              value: locale,
                              groupValue: currentLocale,
                              onChanged: (AvailableLocale? newLocale) {
                                Provider.of<BPLocale>(context, listen: false)
                                    .locale = Locale(locale.fromIntl);
                                Navigator.pop(context);
                              },
                              activeColor: BPColors.primaryColor),
                        )
                    ],
                  )));
        },
        child: CountryFlag.fromCountryCode(currentLocale.flag_code,
            shape: const RoundedRectangle(12)),
      );
    });
  }
}

enum AvailableLocale implements Comparable<AvailableLocale> {
  en(name: 'English', fromIntl: 'en', flag_code: 'gb'),
  fr(name: 'Français', fromIntl: 'fr', flag_code: 'fr');

  const AvailableLocale(
      {required this.name, required this.fromIntl, required this.flag_code});

  final String name;
  final String fromIntl;
  final String flag_code;

  @override
  int compareTo(AvailableLocale other) => 1;
}
