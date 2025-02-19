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

  List<Player> getAlivePlayers() {
    return this._players.where((player) => player.inLife).toList();
  }

  void eliminatePlayer(Player player) {
    player.inLife = false;
    _players.forEach((p) {
      if (p.name == player.name) p.inLife = false;
    });
    notifyListeners();
  }

  void restart() {
    _players.clear();
    notifyListeners();
  }
}
