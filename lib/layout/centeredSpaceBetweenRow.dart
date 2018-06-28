import 'package:flutter/material.dart';
import 'abstractCenteredRow.dart';

class CenteredSpacedBetweenRow extends AbstractCenteredRow {
  CenteredSpacedBetweenRow({
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
