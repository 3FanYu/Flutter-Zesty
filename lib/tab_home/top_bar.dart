import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSize {
  final double _preferedHeight = 100.0;
  String title;
  Color backgroundColor;
  Color textColor;
  double fontSize;
  TopBar({this.title="", this.backgroundColor, this.textColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferedHeight,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
          Icon(
            Icons.mail,
          ),
        ],
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
