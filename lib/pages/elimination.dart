import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/components/players/bp-players-eliminate-list.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:bisrepetita/pages/question.dart';
import 'package:bisrepetita/pages/result.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EliminationPage extends StatelessWidget {
  const EliminationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: BPAppBar(
            backButton: false,
            title: getAppLocalizations(context)!.elimination_page_title,
            closeButton: true),
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: Column(
            children: [
              Flexible(flex: 8, child: BPPlayersEliminateList()),
              Flexible(
                flex: 1,
                child: Center(child:
                    Consumer<PlayersList>(builder: (context, players, child) {
                  var questions = context.read<Question>();
                  return FilledButton(
                      onPressed: () {
                        var alivePlayers = players.getAlivePlayers();
                        var haveOtherQuestion =
                            questions.haveOtherQuestions(context);
                        if (!haveOtherQuestion) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResultPage(noMoreQuestion: true)));
                        } else if (alivePlayers.length >= 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QuestionPage()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                      winner: alivePlayers.firstOrNull)));
                        }
                      },
                      style: Theme.of(context).filledButtonTheme.style,
                      child: Text(
                          style: TextStyle(color: BPColors.textColor),
                          getAppLocalizations(context)!
                              .elimination_page_continue));
                })),
              )
            ],
          ),
        ));
  }
}
