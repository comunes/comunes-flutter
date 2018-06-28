import 'package:flutter/material.dart';

abstract class AbstractCenteredColumn extends Column {
  AbstractCenteredColumn({
    Key key,
    MainAxisAlignment mainAxisAlignment,
    TextDirection textDirection,
    TextBaseline textBaseline,
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
