import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zesty/tab_home/top_bar.dart';
import 'body.dart';

mixin NamedRoute implements Widget {
  String get routeName;
}

class HomePage extends StatefulWidget with NamedRoute {
  HomePage({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();

  @override
  // TODO: implement routeName
  String get routeName => '/';
}

class _NavBarState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#F1F1F1'),
      appBar: TopBar(
        
      ),
      body: HomeBody(),
    );

    // return ScopedModel<MealModel>(
    //   model: mealModel,
    //   child: ScopedModelDescendant<MealModel>(
    //     builder: (context, child, model) => Scaffold(
    //       backgroundColor: Hexcolor('#F1F1F1'),
    //       appBar: TopBar(
    //         title: "地點：臺中科技大學",
    //         backgroundColor: Hexcolor('#F1F1F1'),
    //         fontSize: 20.0,
    //         textColor: Hexcolor('#727272'),
    //       ),
    //     ),
    //   ),
    // );
  }
}
