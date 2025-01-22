import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/models/player.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:bisrepetita/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  final Player? winner;

  const ResultPage({super.key, this.winner});

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: BPAppBar(
            backButton: false,
            title: winner == null ? 'Dommage' : 'Gagnant·e',
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
                        style: GoogleFonts.poppins(
                            fontSize: 38,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                        winner == null
                            ? 'Personne n\'a gagné!\nLa·le chef·fe a été original·e.'
                            : 'Bravo ${winner!.name}!\nTu connais bien la·le chef·fe.'),
                  )),
              Flexible(
                  child: Center(
                      child: FilledButton(
                          onPressed: () {
                            Provider.of<Question>(context, listen: false)
                                .restart();
                            Provider.of<PlayersList>(context, listen: false)
                                .restart();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          style: FilledButton.styleFrom(
                            minimumSize: Size.fromHeight(40),
                            backgroundColor: Color(0xFF816E94),
                          ),
                          child: Text(
                              style: TextStyle(color: Colors.white),
                              'Fin de la partie'))))
            ],
          ),
        ));
  }
}
