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
            DecoratedBox(
              key: Key(index.toString()),
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      Divider.createBorderSide(context, color: Colors.white),
                ),
              ),
              child: ListTile(
                key: Key('$index'),
                tileColor: Colors.transparent,
                title: Text(
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                    '${_players[index].name}'),
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                leading: ReorderableDragStartListener(
                    index: index,
                    child: const Icon(color: Colors.white, Icons.reorder)),
                trailing: Container(
                  height: 24,
                  padding: const EdgeInsets.all(0),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _players.removeAt(index);
                        });
                      },
                      iconSize: 24,
                      padding: EdgeInsets.zero,
                      icon: const Icon(color: Color(0xFF7B2D26), Icons.close)),
                ),
              ),
            ),
          DecoratedBox(
            key: Key('ajouter'),
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context, color: Colors.white),
              ),
            ),
            child: ListTile(
              key: Key('ajouter'),
              tileColor: Colors.transparent,
              title: Text(
                  style: GoogleFonts.poppins(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  'Ajouter'),
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              leading: IconButton(
                  onPressed: () {},
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  icon: const Icon(color: Colors.white, Icons.add)),
              onTap: () {
                print('je souhaite ajouter');
              },
            ),
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
