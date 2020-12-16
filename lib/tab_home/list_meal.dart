import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zesty/conf/config.inc.dart';
import 'package:zesty/meal_page/meal_detail.dart';

class WishList extends StatelessWidget implements PreferredSize {
  final double _preferedHeight = 100.0;
  int id;
  String title;
  Color backgroundColor;
  Color textColor;
  double fontSize;
  String chefName;
  String categoryName;
  String path;
  int stars;
  Conf config = new Conf();
  WishList({
    this.id,
    this.title,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.chefName,
    this.categoryName,
    this.stars,
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MealDetailPage(mealID:id)),
          );
        },
        child: Column(
          children: [
            new Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(config.imagePath + path)),
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.title),
                      Spacer(flex: 10),
                      Text(
                        "$stars",
                      ),
                      Icon(
                        Icons.star,
                        color: Hexcolor('#FFD215'),
                      ),
                      Text("(12)"),
                      Spacer(flex: 1),
                    ],
                  ),
                  Text(chefName,
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  Text(categoryName),
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_preferedHeight);
}
