import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late TextEditingController _answerController;
  FocusNode _focusNodeTextField = FocusNode();
  bool validMasterAnswer = false;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
    _focusNodeTextField.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeTextField.removeListener(_onFocusChange);
    _focusNodeTextField.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focusNodeTextField.hasFocus}");
  }

  @override
  Widget build(BuildContext context) {
    return BPPage(
        appBar: BPAppBar(backButton: true, title: 'Question'),
        child: Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Column(
              children: [
                Flexible(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<Question>(builder: (context, question, child) {
                          question.getNewQuestion(context);
                          return Text(
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                              question.currentQuestion);
                        }),
                        SizedBox(height: 5),
                        TextField(
                          focusNode: _focusNodeTextField,
                          controller: _answerController,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1)),
                              contentPadding: EdgeInsets.zero,
                              counterText: '', // to hide the counter of length
                              suffix: _focusNodeTextField.hasFocus
                                  ? Transform(
                                      transform:
                                          Matrix4.translationValues(0, 3.5, 0),
                                      child: Container(
                                        height: 24,
                                        decoration: const ShapeDecoration(
                                          shape: CircleBorder(),
                                          color: Colors.white,
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _answerController.clear();
                                              });
                                            },
                                            iconSize: 24,
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                                color: Color(0xFF7B2D26),
                                                Icons.close)),
                                      ),
                                    )
                                  : null),
                          cursorColor: Colors.white,
                          autocorrect: false,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          onSubmitted: (event) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Center(
                        child: FilledButton(
                            onPressed:
                                _answerController.text != "" ? () {} : null,
                            style: FilledButton.styleFrom(
                              minimumSize: Size.fromHeight(40),
                              backgroundColor: Color(0xFF816E94),
                              disabledBackgroundColor: Color(0xFF816E94),
                            ),
                            child: Text(
                                style: TextStyle(
                                    color: _answerController.text != ""
                                        ? Colors.white
                                        : Color(0xFF7B2D26).withOpacity(0.6)),
                                _answerController.text != ""
                                    ? 'Valider'
                                    : 'Indiquez votre réponse'))))
                /*FilledButton(
                onPressed: () {

                },
                child: Text('Regenérer'))*/
              ],
            )));
  }
}
