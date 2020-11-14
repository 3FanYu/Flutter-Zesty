import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zesty/tab_search/search_bar.dart';
import 'package:zesty/tab_search/top_bar.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopBar(
      //   backgroundColor: Hexcolor('#F1F1F1'),
      //   fontSize: 20.0,
      //   textColor: Hexcolor('#727272'),
      // ),
      appBar: TheSearchBar(),
    );
  }
}
