import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BPLanguageSelect extends StatefulWidget {
  const BPLanguageSelect({super.key});

  @override
  State<StatefulWidget> createState() => _BPLanguageSelectState();
}

class _BPLanguageSelectState extends State<BPLanguageSelect> {
  AvailableLocale? _locale;

  @override
  void initState() {
    super.initState();
    _locale = AvailableLocale.values
        .where((locale) =>
            locale.fromIntl == Intl.shortLocale(Intl.getCurrentLocale()))
        .first;
  }

  @override
  Widget build(BuildContext context) {
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
                            groupValue: _locale,
                            onChanged: (AvailableLocale? newLocale) {
                              setState(() {
                                _locale = newLocale;
                                Navigator.pop(context);
                              });
                            },
                            activeColor: Color(0xFF816E94)),
                      )
                  ],
                )));
      },
      child: CountryFlag.fromCountryCode(_locale!.flag_code,
          shape: const RoundedRectangle(12)),
    );
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
