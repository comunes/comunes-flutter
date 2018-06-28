import 'package:flutter/material.dart';
import 'abstractCenteredRow.dart';

class CenteredSpacedAroundRow extends AbstractCenteredRow {
  CenteredSpacedAroundRow({
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
