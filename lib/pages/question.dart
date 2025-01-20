import 'package:bisrepetita/components/bp-app-bar.dart';
import 'package:bisrepetita/components/bp-page.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var questionWatcher = context.read<Question>();
    questionWatcher.getNewQuestion(context);
    return BPPage(
        appBar: BPAppBar(backButton: true, title: 'Question'),
        child: Column(
          children: [
            Consumer<Question>(builder: (context, question, child) {
              return Text(question.currentQuestion);
            }),
            FilledButton(
                onPressed: () {
                  Provider.of<Question>(context, listen: false)
                      .getNewQuestion(context);
                },
                child: Text('Regenérer'))
          ],
        ));
  }
}
