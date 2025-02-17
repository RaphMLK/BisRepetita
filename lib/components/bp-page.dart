import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:flutter/material.dart';

class BPPage extends StatelessWidget {
  final Widget? appBar;
  final Widget child;

  const BPPage({super.key, this.appBar, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [BPColors.backgroundColor1, BPColors.backgroundColor2])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: (appBar != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(80), child: appBar!)
              : null),
          body: child),
    );
  }
}
