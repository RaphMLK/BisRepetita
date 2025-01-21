import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:bisrepetita/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BPAppBar extends StatelessWidget {
  final bool backButton;
  final bool? closeButton;
  final String title;

  const BPAppBar(
      {super.key,
      required this.backButton,
      this.closeButton,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      titleTextStyle:
          GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w200),
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: false,
      leading: (backButton
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
            )
          : null),
      actions: [
        if (closeButton == true)
          IconButton(
              onPressed: () {
                Provider.of<Question>(context, listen: false).restart();
                Provider.of<PlayersList>(context, listen: false).restart();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.close),
              color: Colors.white)
      ],
    );
  }
}
