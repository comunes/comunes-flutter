import 'package:flutter/material.dart';
import 'abstractCenteredRow.dart';

class CenteredRow extends AbstractCenteredRow {
  CenteredRow({
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
