import 'package:flutter/material.dart';
import 'centeredColumn.dart';
import 'centeredRow.dart';

class CenteredMaxWidget extends CenteredColumn {
  CenteredMaxWidget({
    Key key,
    TextDirection textDirection,
    TextBaseline textBaseline,
    List<Widget> children: const <Widget>[],
  }) : super(
    children: <Widget>[new CenteredRow(children: children)],
          key: key,
          textDirection: textDirection,
          textBaseline: textBaseline,
        );
}
