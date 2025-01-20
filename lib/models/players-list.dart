import 'package:bisrepetita/models/player.dart';
import 'package:flutter/cupertino.dart';

class PlayersList extends ChangeNotifier {
  List<Player> _players = [];
  List<Player> get players => _players;

  set players(List<Player> newList) {
    _players = newList;
    notifyListeners();
  }

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }
}
