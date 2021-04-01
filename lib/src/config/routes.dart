import 'package:flutter/material.dart';
import 'package:mystock/src/pages/pages.dart';

class Routes {
  static const home = '/home';
  static const login = '/login';
  static const dashboard = '/dashboard';

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
    dashboard: (context) => DashBoardPage(),
  };

  static Map<String, WidgetBuilder> getPage() => _route;
}
