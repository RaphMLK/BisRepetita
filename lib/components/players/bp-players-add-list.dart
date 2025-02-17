import 'package:bisrepetita/models/player.dart';
import 'package:bisrepetita/models/players-list.dart';
import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:bisrepetita/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BPPlayersAddList extends StatefulWidget {
  const BPPlayersAddList({super.key});

  @override
  State<StatefulWidget> createState() => _BPPlayersAddListState();
}

class _BPPlayersAddListState extends State<BPPlayersAddList> {
  bool _addPlayerInput = false;
  late TextEditingController _addPlayerController;

  @override
  void initState() {
    super.initState();
    _addPlayerController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var _players = context.read<PlayersList>();
    return ReorderableListView(
        buildDefaultDragHandles: false,
        proxyDecorator: _proxyDecorator,
        clipBehavior: Clip.hardEdge,
        header: DecoratedBox(
          key: Key('chief'),
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context,
                  color: BPColors.dividerColor),
            ),
          ),
          child: ListTile(
            key: Key('chief'),
            tileColor: Colors.transparent,
            title: Text(
                style: Theme.of(context).textTheme.bodySmall,
                getAppLocalizations(context)!
                    .add_players_list_component_master),
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            leading: IconButton(
                onPressed: () {},
                iconSize: 24,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: Icon(color: BPColors.textColor, Icons.face)),
          ),
        ),
        footer: _addPlayerInput
            ? DecoratedBox(
                key: Key('ajouter'),
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: Divider.createBorderSide(context,
                        color: BPColors.dividerColor),
                  ),
                ),
                child: ListTile(
                  key: Key('ajouter'),
                  tileColor: Colors.transparent,
                  title: TextField(
                    controller: _addPlayerController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        counterText: '', // to hide the counter of length
                        suffix: Transform(
                          transform: Matrix4.translationValues(0, 3.5, 0),
                          child: Container(
                            height: 24,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: BPColors.dividerColor,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  _addAndValidatePlayer(context);
                                },
                                iconSize: 24,
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                    color: BPColors.primaryColor, Icons.check)),
                          ),
                        )),
                    cursorColor: BPColors.textColor,
                    autocorrect: false,
                    autofocus: true,
                    maxLength: 15,
                    style: Theme.of(context).textTheme.bodySmall,
                    onTapOutside: (event) {
                      _addAndValidatePlayer(context);
                    },
                    onSubmitted: (event) {
                      _addAndValidatePlayer(context);
                    },
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  leading: IconButton(
                      onPressed: () {},
                      iconSize: 24,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      icon: Icon(color: BPColors.textColor, Icons.add)),
                ),
              )
            : DecoratedBox(
                key: Key('ajouter'),
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        Divider.createBorderSide(context, color: Colors.white),
                  ),
                ),
                child: ListTile(
                  key: Key('ajouter'),
                  tileColor: Colors.transparent,
                  title: Text(
                      style: GoogleFonts.poppins(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                      getAppLocalizations(context)!
                          .add_players_list_component_add),
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  leading: IconButton(
                      onPressed: () {},
                      iconSize: 24,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      icon: const Icon(color: Colors.white, Icons.add)),
                  onTap: () {
                    setState(() {
                      _addPlayerInput = true;
                    });
                  },
                ),
              ),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            var cloneList = List<Player>.from(_players.players);
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Player item = cloneList.removeAt(oldIndex);
            cloneList.insert(newIndex, item);
            _players.players = cloneList;
          });
        },
        children: <Widget>[
          for (int index = 0; index < _players.players.length; index += 1)
            DecoratedBox(
              key: Key(index.toString()),
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      Divider.createBorderSide(context, color: Colors.white),
                ),
              ),
              child: ListTile(
                key: Key('$index'),
                tileColor: Colors.transparent,
                title: Text(
                    style: Theme.of(context).textTheme.bodySmall,
                    _players.players[index].name),
                contentPadding: EdgeInsets.zero,
                leading: ReorderableDragStartListener(
                    index: index,
                    child: Icon(color: BPColors.textColor, Icons.reorder)),
                trailing: Container(
                  height: 24,
                  padding: const EdgeInsets.all(0),
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: BPColors.dividerColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          var cloneList = List<Player>.from(_players.players);
                          cloneList.removeAt(index);
                          _players.players = cloneList;
                        });
                      },
                      iconSize: 24,
                      padding: EdgeInsets.zero,
                      icon: Icon(color: BPColors.dangerColor, Icons.close)),
                ),
              ),
            ),
        ]);
  }

  void _addAndValidatePlayer(BuildContext context) {
    setState(() {
      _addPlayerInput = false;
    });
    var players = context.read<PlayersList>();
    var cloneList = new List<Player>.from(players.players);
    cloneList.add(new Player(_addPlayerController.text));
    players.players = cloneList;
    _addPlayerController.clear();
  }

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Material(
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }
}
