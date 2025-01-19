import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF19535F), Color(0xFF0B7A75)]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: 'BisRepetita.\n',
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        height: 0.7,
                        fontWeight: FontWeight.w600
                      ),
                      children: [
                        TextSpan(
                          text: 'Sois Original.',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold
                          )
                        )
                      ]
                    )

                  )
                )
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                          backgroundColor: Color(0xFF816E94)
                      ),
                      child: Text('Jouer'),
                    ),
                    const SizedBox(height: 25),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                          backgroundColor: Color(0xFF816E94)
                      ),
                      child: Text('Règles'),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }

}