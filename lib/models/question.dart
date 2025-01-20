import 'dart:convert';

import 'package:bisrepetita/models/players-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Question extends ChangeNotifier {
  late Map<String, dynamic> questions;
  late String currentQuestion = "";
  List<String> _questionsAlreadyAsked = [];

  List<QuestionType> allQuestionType = [
    QuestionType.cat1,
    QuestionType.cat2,
    QuestionType.cat3,
    QuestionType.cat4,
    QuestionType.cat5
  ];

  Question() {
    questions = <String, dynamic>{};
  }

  void getNewQuestion(BuildContext context) async {
    if (questions.isEmpty) {
      // load questions from json files
      String data = await DefaultAssetBundle.of(context)
          .loadString("assets/questions/questions.json");
      questions = jsonDecode(data);
    }

    var playersWatcher = context.read<PlayersList>();
    int nbPlayerAlive = playersWatcher.getAlivePlayers().length;

    String question = "undefined";
    while (question == "undefined") {
      String questionType = _randomQuestionType(nbPlayerAlive).toString();
      List<dynamic> questionFromType = questions[questionType.toString()];
      dynamic randomQuestion = (questionFromType..shuffle()).firstOrNull;
      if (!_questionsAlreadyAsked.contains(randomQuestion.toString())) {
        question = randomQuestion.toString();
      }
    }
    currentQuestion = question.toString();
    _questionsAlreadyAsked.add(currentQuestion);
    notifyListeners();
  }

  QuestionType _randomQuestionType(int nbPlayers) {
    List<QuestionType> questionTypeAvailable =
        allQuestionType.where((type) => type.enoughPlayer(nbPlayers)).toList();
    if (questionTypeAvailable.length >= 4) {
      questionTypeAvailable =
          questionTypeAvailable.sublist(questionTypeAvailable.length - 3);
    }
    if (questionTypeAvailable.length == 1) {
      return questionTypeAvailable[0];
    } else {
      List<QuestionType> probabilityQuestionTypeList = [];
      switch (questionTypeAvailable.length) {
        case 2:
          probabilityQuestionTypeList.add(questionTypeAvailable[0]);
          for (int i = 0; i < 4; i++) {
            probabilityQuestionTypeList.add(questionTypeAvailable[1]);
          }
        default: // when the lenght is 3
          probabilityQuestionTypeList.add(questionTypeAvailable[0]);
          for (int i = 0; i < 3; i++) {
            probabilityQuestionTypeList.add(questionTypeAvailable[1]);
          }
          for (int i = 0; i < 6; i++) {
            probabilityQuestionTypeList.add(questionTypeAvailable[2]);
          }
      }
      return (probabilityQuestionTypeList..shuffle())
          .first; // to get a random type
    }
  }
}

enum QuestionType implements Comparable<QuestionType> {
  cat1(codeJson: "cat1", minPlayers: 11),
  cat2(codeJson: "cat2", minPlayers: 10),
  cat3(codeJson: "cat3", minPlayers: 7),
  cat4(codeJson: "cat4", minPlayers: 4),
  cat5(codeJson: "cat5", minPlayers: 2);

  const QuestionType({required this.codeJson, required this.minPlayers});

  final String codeJson;
  final int minPlayers;

  @override
  int compareTo(QuestionType other) => minPlayers - other.minPlayers;

  @override
  String toString() {
    return codeJson;
  }

  bool enoughPlayer(int nbPlayer) => minPlayers >= nbPlayer;
}
