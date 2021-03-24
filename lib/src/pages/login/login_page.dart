import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock/src/config/theme.dart' as custom_theme;
import 'package:mystock/src/pages/login/widgets/header.dart';
import 'package:mystock/src/pages/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(gradient: custom_theme.Theme.gradient),
          ),
          Column(
            children: [
              Header(),
              LoginForm(),
              Text("forgot password"),
              Text("SSO"),
              Text("register"),
            ],
          ),
        ],
      ),
    );
  }
}
