import 'package:flutter/material.dart';
import 'abstractCenteredColumn.dart';

class CenteredSpaceEvenlyColumn extends AbstractCenteredColumn {
  CenteredSpaceEvenlyColumn({
    Key key,
    TextDirection textDirection,
    TextBaseline textBaseline,
    List<Widget> children: const <Widget>[],
  }) : super(
          children: children,
          key: key,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: textDirection,
          textBaseline: textBaseline,
        );
}
