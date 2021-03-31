import 'package:flutter/material.dart';
import 'package:mystock/src/config/theme.dart' as custom_theme;
import 'package:mystock/src/pages/login/widgets/header.dart';
import 'package:mystock/src/pages/login/widgets/login_form.dart';
import 'package:mystock/src/pages/login/widgets/single_sign_on.dart';

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
          SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                LoginForm(),
                SizedBox(height: 30),
                _buildFlatButton("Forgot Password", onPressed: () {}),
                SingleSignOn(),SizedBox(height: 28),
                _buildFlatButton("Don't have an Account", onPressed: () {}),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildFlatButton(
    String text, {
    @required VoidCallback onPressed,
    double fontSize = 16,
  }) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
