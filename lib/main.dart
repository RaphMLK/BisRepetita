import 'package:bisrepetita/models/locale.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:bisrepetita/pages/HomePage.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => PlayersList()),
      ChangeNotifierProvider(create: (context) => Question())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = getAppLocalizations(context);
    final title = l10n?.title;

    return ChangeNotifierProvider(
        create: (context) => BPLocale(),
        child: Consumer<BPLocale>(
            builder: (context, bplocale, child) => MaterialApp(
                  title: title,
                  locale: bplocale.locale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  home: HomePage(),
                )));
  }
}
