import 'package:flutter/material.dart';
import 'package:mystock/src/pages/login/login_page.dart';
import 'package:mystock/src/config/routes.dart' as routes;


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routes.Routes.getPage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}


