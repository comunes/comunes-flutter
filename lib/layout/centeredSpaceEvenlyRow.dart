import 'package:flutter/material.dart';
import 'abstractCenteredRow.dart';

class CenteredSpacedEvenlyRow extends AbstractCenteredRow {
  CenteredSpacedEvenlyRow({
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
