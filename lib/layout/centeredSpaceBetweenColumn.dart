import 'package:flutter/material.dart';
import 'abstractCenteredColumn.dart';

class CenteredSpaceBetweenColumn extends AbstractCenteredColumn {
  CenteredSpaceBetweenColumn({
    Key key,
    TextDirection textDirection,
    TextBaseline textBaseline,
    List<Widget> children: const <Widget>[],
  }) : super(
          children: children,
          key: key,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: textDirection,
          textBaseline: textBaseline,
        );
}
