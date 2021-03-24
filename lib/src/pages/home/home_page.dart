import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mystock/src/constants/asset.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Asset.LOGO_IMAGE),
          Image.network('https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png'),
        ],
      ),

    );
  }
}
