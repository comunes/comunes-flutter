import 'package:flutter/material.dart';
import 'abstractCenteredColumn.dart';

class CenteredSpaceAroundColumn extends AbstractCenteredColumn {
  CenteredSpaceAroundColumn({
    Key key,
    TextDirection textDirection,
    TextBaseline textBaseline,
    List<Widget> children: const <Widget>[],
  }) : super(
          children: children,
          key: key,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: textDirection,
          textBaseline: textBaseline,
        );
}
