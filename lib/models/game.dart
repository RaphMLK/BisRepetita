import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/models/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Game extends ChangeNotifier {
  void restart(BuildContext context) {
    Provider.of<PlayersList>(context, listen: false).restart();
    Provider.of<Question>(context, listen: false).restart();
    notifyListeners();
  }
}
