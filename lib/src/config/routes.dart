import 'package:flutter/material.dart';
import 'package:mystock/src/pages/pages.dart';

class Routes {
  static const home = '/home';
  static const login = '/login';

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
  };

  static Map<String, WidgetBuilder> getPage() => _route;
}
