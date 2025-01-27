import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulePage extends StatelessWidget {
  const RulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: new BPAppBar(
            backButton: true,
            title: getAppLocalizations(context)!.rules_page_title),
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
                          getAppLocalizations(context)!.rules_page_1))
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
                          getAppLocalizations(context)!.rules_page_2)),
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
                          getAppLocalizations(context)!.rules_page_3))
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
                          getAppLocalizations(context)!.rules_page_4)),
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
