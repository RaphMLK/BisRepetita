import 'package:bisrepetita/models/player.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/pages/result.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BPPlayersEliminateList extends StatefulWidget {
  const BPPlayersEliminateList({super.key});

  @override
  State<StatefulWidget> createState() => _BPPlayersEliminateListState();
}

class _BPPlayersEliminateListState extends State<BPPlayersEliminateList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayersList>(builder: (context, players, child) {
      return ListView(children: [
        for (final player in players.getAlivePlayers())
          DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      Divider.createBorderSide(context, color: Colors.white),
                ),
              ),
              child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          dialogWidgetToEliminate(players, player)),
                  child: ListTile(
                      key: Key(player.name),
                      tileColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                          style: Theme.of(context).textTheme.bodySmall,
                          player.name),
                      trailing: Container(
                        height: 24,
                        padding: const EdgeInsets.all(0),
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  dialogWidgetToEliminate(players, player)),
                          iconSize: 24,
                          padding: EdgeInsets.zero,
                          icon: Icon(color: BPColors.dangerColor, Icons.close),
                        ),
                      ))))
      ]);
    });
  }

  Dialog dialogWidgetToEliminate(PlayersList players, Player player) {
    return Dialog(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: BPColors.textOnWhiteColor),
                          getAppLocalizations(context)!
                              .eliminate_players_list_component_prompt_title(
                                  player.name))),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(BPColors.dangerColor)),
                      child: Text(
                          style: Theme.of(context).textTheme.labelSmall,
                          getAppLocalizations(context)!
                              .eliminate_players_list_component_cancel)),
                  SizedBox(width: 8),
                  TextButton(
                      onPressed: () {
                        players.eliminatePlayer(player);
                        Navigator.pop(context);
                        if (players.getAlivePlayers().isEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage()));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(BPColors.primaryColor)),
                      child: Text(
                          style: Theme.of(context).textTheme.labelSmall,
                          getAppLocalizations(context)!
                              .eliminate_players_list_component_confirm))
                ],
              )
            ],
          )),
    );
  }
}
