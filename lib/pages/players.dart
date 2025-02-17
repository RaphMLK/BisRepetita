import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/components/players/bp-players-add-list.dart';
import 'package:bisrepetita/models/category.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/pages/categories.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
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
                              Provider.of<Category>(context, listen: false)
                                  .generateRandomCategories(3);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoriesPage()));
                            }
                          : null,
                      style: Theme.of(context).filledButtonTheme.style,
                      child: Text(
                          style: TextStyle(
                              color: players.players.length >= 2
                                  ? BPColors.textColor
                                  : BPColors.buttonDangerLabel),
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
