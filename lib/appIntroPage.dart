// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// import 'package:padder/padding.dart';
import 'comunes_flutter.dart';

class AppIntroItem {
  final IconData icon;
  final String title;
  final String subTitle;

  AppIntroItem({this.icon, this.title, this.subTitle = ''});
// 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec vitae eros. Nunc sit amet neque. Ut id dui. Integer viverra feugiat sem. Morbi aliquam turpis rhoncus sapien volutpat condimentum.'});
}

typedef void OnIntroFinish(BuildContext context);
typedef List<AppIntroItem> ListItems(BuildContext context);

abstract class AppIntroPage extends StatelessWidget {
  static const String routeName = '/appintro';
  final ListItems items;
  final OnIntroFinish onIntroFinish;

  const AppIntroPage({Key key, this.items, this.onIntroFinish})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(),
      body: new DefaultTabController(
        length: items(context).length,
        child: new _AppIntroPageSelector(items: items, onFinish: onIntroFinish),
      ),
    );
  }
}

class _AppIntroPageSelector extends StatelessWidget {
  const _AppIntroPageSelector({this.items, this.onFinish});

  final ListItems items;
  final OnIntroFinish onFinish;

  void _handleArrowButtonPress(BuildContext context, int delta) {
    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller
          .animateTo((controller.index + delta).clamp(0, items(context).length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final ThemeData theme = Theme.of(context);
    final Color color = theme.accentColor;
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: color);
    final TextStyle subTitleStyle =
        theme.textTheme.subhead; //.copyWith(color: color);
    // final TextStyle descriptionStyle = theme.textTheme.subhead;
    return new SafeArea(
      top: true,
      bottom: false,
      child: new Column(
        children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            new IconButton(
                onPressed: () {
                  onFinish(context);
                },
                icon: new Icon(Icons.close, size: 30.0, color: Colors.black38)),
          ]),
          new Expanded(
              child: new OrientationBuilder(builder: (context, orientation) {
            return new IconTheme(
              data: new IconThemeData(
                size: orientation == Orientation.portrait ? 200.0 : 100.0,
                color: color,
              ),
              child: new TabBarView(
                  children: items(context).map((AppIntroItem item) {
                return new Container(
                  padding: const EdgeInsets.all(12.0),
                  child: new Center(
                    child: new CenteredSpaceEvenlyColumn(children: <Widget>[
                      Icon(
                        item.icon,
                        semanticLabel: item.title,
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                          child: new CenteredColumn(children: <Widget>[
                            new Text(
                              item.title,
                              style: titleStyle,
                              textAlign: TextAlign.center,
                            ),
                            new SizedBox(height: 20.0),
                            new Text(
                              item.subTitle,
                              style: subTitleStyle,
                              textAlign: TextAlign.center,
                            )
                          ])),
                    ]),
                  ),
                );
              }).toList()),
            );
          })),
          new Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: new Row(
                  children: listWithoutNulls(<Widget>[
                    new IconButton(
                        icon: const Icon(Icons.chevron_left),
                        color: color,
                        onPressed: () {
                          _handleArrowButtonPress(context, -1);
                        },
                        tooltip: 'Page back'),
                    new TabPageSelector(controller: controller),
                    new IconButton(
                        icon: const Icon(Icons.chevron_right),
                        color: color,
                        onPressed: () {
                          _handleArrowButtonPress(context, 1);
                          if (!controller.indexIsChanging &&
                              controller.index == items(context).length - 1) {
                            onFinish(context);
                          }
                        },
                        tooltip: 'Page forward'),
                  ]),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween)),
        ],
      ),
    );
  }
}
