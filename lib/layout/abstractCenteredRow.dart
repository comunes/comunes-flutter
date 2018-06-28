import 'package:flutter/material.dart';

abstract class AbstractCenteredRow extends Row {
  AbstractCenteredRow({
    Key key,
    TextDirection textDirection,
    TextBaseline textBaseline,
    mainAxisAlignment,
    List<Widget> children: const <Widget>[],
  }) : super(
          children: children,
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: textDirection,
          verticalDirection: VerticalDirection.down,
          textBaseline: textBaseline,
        );
}
