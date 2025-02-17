import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:bisrepetita/pages/elimination.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:bisrepetita/tools.dart';
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
  final FocusNode _focusNodeTextField = FocusNode();
  bool _validMasterAnswer = false;
  bool _showAnswer = false;
  late Widget _widgetBelowQuestion;
  String _buttonLabel = "";
  late String _masterAnswer;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
    _widgetBelowQuestion = textFieldForMaster();
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
        appBar: BPAppBar(
            backButton: false,
            title: getAppLocalizations(context)!.question_page_title,
            closeButton: true),
        child: Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Column(
              children: [
                Flexible(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Consumer<Question>(
                          builder: (context, question, child) {
                        question.getNewQuestion(context);
                        return Text(
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                            question.currentQuestion);
                      }),
                    )),
                Flexible(
                    flex: 4,
                    child: Column(children: [
                      SizedBox(height: 10),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 200),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: _widgetBelowQuestion,
                      )
                    ])),
                Flexible(
                    flex: 1,
                    child: Center(
                        child: FilledButton(
                            onPressed: _answerController.text != ""
                                ? () {
                                    setState(() {
                                      validStep();
                                    });
                                  }
                                : null,
                            style: Theme.of(context).filledButtonTheme.style,
                            child: Text(
                                style: TextStyle(
                                    color: _answerController.text != ""
                                        ? BPColors.textColor
                                        : BPColors.buttonDangerLabel),
                                _getButtonLabel()))))
              ],
            )));
  }

  validStep() {
    if (!_validMasterAnswer) {
      _validMasterAnswer = true;
      _masterAnswer = _answerController.text;
      _widgetBelowQuestion = SizedBox(height: 60);
      _buttonLabel = getAppLocalizations(context)!.question_page_show_answer;
    } else if (!_showAnswer) {
      _showAnswer = true;
      _buttonLabel = getAppLocalizations(context)!.question_page_show_players;
      _widgetBelowQuestion = answerMasterWidget();
    } else {
      // To hide the next question before to navigate to the next page
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => Provider.of<Question>(context, listen: false).nextQuestion());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const EliminationPage()));
    }
  }

  String _getButtonLabel() {
    if (_buttonLabel == "") {
      _buttonLabel = getAppLocalizations(context)!.question_page_confirm_answer;
    }
    if (_answerController.text != "") {
      return _buttonLabel;
    } else {
      return getAppLocalizations(context)!.question_page_write_answer;
    }
  }

  Widget textFieldForMaster() {
    return TextField(
        focusNode: _focusNodeTextField,
        controller: _answerController,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: BPColors.dividerColor, width: 1)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: BPColors.dividerColor, width: 1)),
            contentPadding: EdgeInsets.zero,
            counterText: '', // to hide the counter of length
            suffix: _focusNodeTextField.hasFocus
                ? Transform(
                    transform: Matrix4.translationValues(0, 3.5, 0),
                    child: Container(
                      height: 24,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: BPColors.textColor,
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              _answerController.clear();
                            });
                          },
                          iconSize: 24,
                          padding: EdgeInsets.zero,
                          icon: Icon(color: BPColors.dangerColor, Icons.close)),
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
        });
  }

  Widget answerMasterWidget() {
    return Card(
        child: ListTile(
      title: Text(
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: BPColors.textOnWhiteColor),
          getAppLocalizations(context)!.question_page_answer_title),
      subtitle: Text(
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: BPColors.textOnWhiteColor),
          _masterAnswer),
    ));
  }
}
