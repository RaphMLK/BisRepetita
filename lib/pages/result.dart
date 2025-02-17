import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/models/player.dart';
import 'package:bisrepetita/pages/HomePage.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Player? winner;
  final bool? noMoreQuestion;

  const ResultPage({super.key, this.winner, this.noMoreQuestion});

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: BPAppBar(
            backButton: false,
            title: winner == null
                ? getAppLocalizations(context)!.result_page_title_no_winner
                : getAppLocalizations(context)!.result_page_title_winner,
            closeButton: true),
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: Column(
            children: [
              Flexible(
                  flex: 8,
                  child: Center(
                    child: Text(
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                        winner == null
                            ? noMoreQuestion == true
                                ? getAppLocalizations(context)!
                                    .result_page_text_no_more_question
                                : getAppLocalizations(context)!
                                    .result_page_text_no_winner
                            : getAppLocalizations(context)!
                                .result_page_text_winner(winner!.name)),
                  )),
              Flexible(
                  child: Center(
                      child: FilledButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          style: Theme.of(context).filledButtonTheme.style,
                          child: Text(
                              style: TextStyle(color: BPColors.textColor),
                              getAppLocalizations(context)!.result_page_end))))
            ],
          ),
        ));
  }
}
