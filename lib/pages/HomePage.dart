import 'package:bisrepetita/components/bp-language-select.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/pages/players.dart';
import 'package:bisrepetita/pages/rules.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BPPage(
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Center(
                  child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: getAppLocalizations(context)?.home_page_title,
                          style: GoogleFonts.poppins(
                              fontSize: 48,
                              height: 0.7,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: getAppLocalizations(context)
                                    ?.home_page_subtitle,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold))
                          ])))),
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlayersPage()));
                      },
                      style: FilledButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                          backgroundColor: Color(0xFF816E94)),
                      child: Text(
                          getAppLocalizations(context)!.home_page_button_play),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: FilledButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RulePage()));
                                  },
                                  style: FilledButton.styleFrom(
                                      backgroundColor: Color(0xFF816E94)),
                                  child: Text(getAppLocalizations(context)!
                                      .home_page_button_rules),
                                ))),
                        BPLanguageSelect()
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
