import 'package:flutter/material.dart';
import 'abstractCenteredColumn.dart';

class CenteredColumn extends AbstractCenteredColumn {
  CenteredColumn({
    Key key,
    TextDirection textDirection,
    TextBaseline textBaseline,
    List<Widget> children: const <Widget>[],
  }) : super(
          children: children,
          key: key,
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: textDirection,
          textBaseline: textBaseline,
        );
}
