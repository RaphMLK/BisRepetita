import 'package:bisrepetita/models/category.dart';
import 'package:bisrepetita/models/game.dart';
import 'package:bisrepetita/models/locale.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:bisrepetita/pages/HomePage.dart';
import 'package:bisrepetita/theme/bp_theme_data.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  // Necessary before to lock the screen orientation
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(
            MultiProvider(providers: [
              ChangeNotifierProvider(create: (context) => PlayersList()),
              ChangeNotifierProvider(create: (context) => Question()),
              ChangeNotifierProvider(create: (context) => Category()),
              ChangeNotifierProvider(create: (context) => Game())
            ], child: const MyApp()),
          ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = getAppLocalizations(context);
    final title = l10n?.title;
    Provider.of<Category>(context).loadAllCategory(context);

    return ChangeNotifierProvider(
        create: (context) => BPLocale(),
        child: Consumer<BPLocale>(
            builder: (context, bplocale, child) => MaterialApp(
                  title: title,
                  locale: bplocale.locale,
                  // Used to set the default language following the device locale
                  localeListResolutionCallback: (allLocales, supportedLocales) {
                    final localeShortName =
                        Intl.shortLocale(bplocale.locale!.languageCode);
                    if (localeShortName == 'fr') {
                      return const Locale('fr');
                    }
                    return const Locale('en');
                  },
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  theme: BPAppTheme.defaultTheme,
                  home: HomePage(),
                )));
  }
}
