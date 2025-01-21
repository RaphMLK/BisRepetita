import 'package:bisrepetita/models/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BPQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Question>(builder: (context, question, child) {
      question.getNewQuestion(context);
      return Text(question.currentQuestion);
    });
  }
}
