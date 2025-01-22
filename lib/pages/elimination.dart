import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/components/players/bp-players-eliminate-list.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/pages/question.dart';
import 'package:bisrepetita/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EliminationPage extends StatefulWidget {
  const EliminationPage({super.key});

  @override
  State<StatefulWidget> createState() => _EliminationPageState();
}

class _EliminationPageState extends State<EliminationPage> {
  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar:
            BPAppBar(backButton: false, title: "Eliminer ?", closeButton: true),
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: Column(
            children: [
              Flexible(flex: 8, child: BPPlayersEliminateList()),
              Flexible(
                flex: 1,
                child: Center(child:
                    Consumer<PlayersList>(builder: (context, players, child) {
                  return FilledButton(
                      onPressed: () {
                        var alivePlayers = players.getAlivePlayers();
                        if (alivePlayers.length >= 2) {
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
                      style: FilledButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        backgroundColor: Color(0xFF816E94),
                      ),
                      child:
                          Text(style: TextStyle(color: Colors.white), 'Suite'));
                })),
              )
            ],
          ),
        ));
  }
}
