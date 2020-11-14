import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class TheSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final double _preferedHeight = 100.0;
  TheSearchBar({Key key}) : super(key: key);

  @override
  _TheSearchBar createState() => _TheSearchBar();

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_preferedHeight);
}

class _TheSearchBar extends State<TheSearchBar> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text(
          'Search Bar Test',
          style: TextStyle(color: Hexcolor('#0A0A0A')),
        ),
        backgroundColor: Hexcolor('#FFFFFF'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  _TheSearchBar() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
    );
  }
}
