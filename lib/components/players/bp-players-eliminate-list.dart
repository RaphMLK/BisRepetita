import 'package:bisrepetita/models/players-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: ListTile(
                  key: Key(player.name),
                  tileColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                      style: GoogleFonts.poppins(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
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
                            builder: (BuildContext context) => Dialog(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                  'Eliminer ${player.name} ?'),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              Color(
                                                                  0xFF7B2D26))),
                                                  child: Text(
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white),
                                                      'Non')),
                                              SizedBox(width: 8),
                                              TextButton(
                                                  onPressed: () {
                                                    players.eliminatePlayer(
                                                        player);
                                                    Navigator.pop(context);
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              Color(
                                                                  0xFF816E94))),
                                                  child: Text(
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white),
                                                      'Oui'))
                                            ],
                                          )
                                        ],
                                      )),
                                )),
                        iconSize: 24,
                        padding: EdgeInsets.zero,
                        icon:
                            const Icon(color: Color(0xFF7B2D26), Icons.close)),
                  )))
      ]);
    });
  }
}
