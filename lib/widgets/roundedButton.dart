import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final btnRadius = new Radius.circular(90.0);

  final IconData icon;
  final String text;
  final Color backColor;
  final Color fontColor;
  final TextStyle textStyle;
  VoidCallback onPressed;

  RoundedBtn(
      {@required this.icon,
      @required this.text,
      @required this.onPressed,
      @required this.backColor,
      this.textStyle = const TextStyle(fontSize: 20.0, color: Colors.white),
      this.fontColor = Colors.white});

  RoundedBtn.nav(
      {@required this.icon,
      @required this.text,
      @required BuildContext context,
      @required route,
      @required this.backColor,
      this.textStyle = const TextStyle(fontSize: 20.0, color: Colors.white),
      this.fontColor = Colors.white}) {
    this.onPressed = () {
      Navigator.pushNamed(context, route);
    };
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      child: new RaisedButton(
          elevation: 1.0,
          color: backColor,
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(icon, size: 32.0, color: fontColor),
                new SizedBox(width: 10.0),
                new Text(text, style: textStyle),
              ],
            ),
          ),
          onPressed: onPressed,
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(btnRadius))),
    );
  }
}
