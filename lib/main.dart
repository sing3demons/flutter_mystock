import 'package:flutter/material.dart';
import 'package:mystock/src/config/routes.dart' as routes;
import 'package:mystock/src/constants/setting.dart';
import 'package:mystock/src/pages/home/home_page.dart';
import 'package:mystock/src/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes.Routes.getPage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final token = snapshot.data.getString(Setting.TOKEN_PREF) ?? '';
            if (token.isNotEmpty) {
              return HomePage();
            }
            return LoginPage();
          }
          return SizedBox();
        },
      ),
    );
  }
}
