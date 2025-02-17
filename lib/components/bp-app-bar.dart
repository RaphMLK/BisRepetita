import 'package:bisrepetita/pages/HomePage.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:flutter/material.dart';

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
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.close),
              color: BPColors.textColor)
      ],
    );
  }
}
