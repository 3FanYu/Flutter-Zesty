import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishPage extends StatefulWidget {
  WishPage({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<WishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WishPage"),
      ),
    );
  }
}
