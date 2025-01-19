import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulePage extends StatelessWidget {
  const RulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: new BPAppBar(backButton: true, title: 'Règles'),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              Row(
                spacing: 10,
                children: [
                  Expanded(
                      child: Icon(color: Colors.white, size: 80, Icons.face)),
                  Expanded(
                      flex: 3,
                      child: Text(
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          'Choisissez votre chef·fe qui devra répondre en premier à une question sur le téléphone.\nNous l’invitons à répondre le plus vite possible et écrire sa première idée sans trop réfléchir.'))
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          'Les autres joueur·euses devront répondre à cette même question à voix haute chacun·e son tour.\nVous ne pouvez pas dire la même réponse qu’une autre personne.\nChacun·e doit avoir une réponse différente.')),
                  Expanded(
                      child: Icon(color: Colors.white, size: 80, Icons.groups)),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                      child: Icon(
                          color: Colors.white,
                          size: 80,
                          Icons.reduce_capacity)),
                  Expanded(
                      flex: 3,
                      child: Text(
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          'Dès que chaque joueur·euse aura donné sa réponse, votre chef·fe révélera sa réponse.\nSi une personne a la même réponse que votre chef·fe, alors iel est éliminé·e.'))
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          'Effectuez autant de rounds nécessaires pour trouver votre gagnant·e (la dernière personne en vie).')),
                  Expanded(
                      child: Icon(
                          color: Colors.white,
                          size: 80,
                          Icons.sentiment_very_satisfied)),
                ],
              ),
            ],
          ),
        ));
  }
}
