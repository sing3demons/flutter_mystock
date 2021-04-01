import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashbord'),
      ),
      body: Center(
          child: FlutterLogo(
        size: 150,
      )),
    );
  }
}
