import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

abstract class MaterialAppWithIntro extends StatelessWidget {
  final String name;
  final ThemeData theme;
  final Map<String, WidgetBuilder> routes;
  final WidgetBuilder introWidget;
  final WidgetBuilder continueWidget;
  final String prefsKey;

  MaterialAppWithIntro(this.name, this.theme, this.routes, this.introWidget,
    this.continueWidget, this.prefsKey);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MaterialAppWithIntroHome(introWidget, continueWidget, prefsKey),
      title: name,
      theme: theme,
      routes: routes);
  }
}

class MaterialAppWithIntroHome extends StatefulWidget {
  final WidgetBuilder introWidget;
  final WidgetBuilder continueWidget;
  final String prefsKey;

  MaterialAppWithIntroHome(this.introWidget, this.continueWidget, this.prefsKey);

  @override
  _MaterialAppWithIntroState createState() =>
    _MaterialAppWithIntroState(introWidget, continueWidget, prefsKey);
}

class _MaterialAppWithIntroState extends State<MaterialAppWithIntroHome> {
  final WidgetBuilder introWidget;
  final WidgetBuilder continueWidget;
  final String prefsKey;

  _MaterialAppWithIntroState(this.introWidget, this.continueWidget, this.prefsKey);

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 1000), () {
      checkFirstStart();
    });
  }

  // https://stackoverflow.com/questions/50654195/flutter-one-time-intro-screen
  Future checkFirstStart() async {
    final String initialWizardKey = prefsKey;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showInitialWizard = (prefs.getBool(initialWizardKey) ?? true);

    if (showInitialWizard) {
      prefs.setBool(initialWizardKey, false);
      print('Show initial intro at first start');
      Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: this.introWidget));
    } else {
      print('Don\'t show initial intro ');
      Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: this.continueWidget));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CircularProgressIndicator(),// Loading...
      ),
    );
  }
}
