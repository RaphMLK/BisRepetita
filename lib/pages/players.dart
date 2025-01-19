import 'dart:ui';

import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/models/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  State<StatefulWidget> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: new BPAppBar(backButton: true, title: 'Joueur·euses'),
        child: BPPlayersList());
  }
}

class BPPlayersList extends StatefulWidget {
  const BPPlayersList({super.key});

  @override
  State<StatefulWidget> createState() => _BPPlayersListState();
}

class _BPPlayersListState extends State<BPPlayersList> {
  List<Player> _players = [Player('Rafa'), Player('Selma'), Player('Victoire')];

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Material(
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
        buildDefaultDragHandles: false,
        proxyDecorator: _proxyDecorator,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        children: <Widget>[
          for (int index = 0; index < _players.length; index += 1)
            ListTile(
              key: Key('$index'),
              tileColor: Colors.transparent,
              title: Text(
                  style: GoogleFonts.poppins(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  '${_players[index].name}'),
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              leading: ReorderableDragStartListener(
                  index: index,
                  child: const Icon(color: Colors.white, Icons.reorder)),
            )
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Player item = _players.removeAt(oldIndex);
            _players.insert(newIndex, item);
          });
        });
  }
}
