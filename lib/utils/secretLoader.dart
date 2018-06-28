import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});

  Future<Map<String, dynamic>> load() {
    rootBundle.loadString(secretPath, cache: false);
    return rootBundle.loadStructuredData<Map<String, dynamic>>(this.secretPath,
        (jsonStr) async {
      return json.decode(jsonStr);
    });
  }
}