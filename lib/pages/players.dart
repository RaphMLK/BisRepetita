import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/components/players/bp-players-add-list.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/pages/question.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  State<StatefulWidget> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: BPAppBar(
            backButton: true,
            title: getAppLocalizations(context)!.players_page_title),
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: Column(
            children: [
              Flexible(flex: 8, child: BPPlayersAddList()),
              Flexible(
                flex: 1,
                child: Center(child:
                    Consumer<PlayersList>(builder: (context, players, child) {
                  return FilledButton(
                      onPressed: players.players.length >= 2
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuestionPage()));
                            }
                          : null,
                      style: FilledButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        backgroundColor: Color(0xFF816E94),
                        disabledBackgroundColor: Color(0xFF816E94),
                      ),
                      child: Text(
                          style: TextStyle(
                              color: players.players.length >= 2
                                  ? Colors.white
                                  : Color(0xFF7B2D26).withOpacity(0.6)),
                          players.players.length >= 2
                              ? getAppLocalizations(context)!
                                  .players_page_launch
                              : getAppLocalizations(context)!
                                  .players_page_2_players_minimum));
                })),
              )
            ],
          ),
        ));
  }
}
