import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mystock/src/constants/asset.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Map<Object, Object> arguments =
        ModalRoute.of(context).settings.arguments;
    final models = Map<String, Object>.from(arguments);

    var name = '';
    var age = 0;

    if (models['name'] is String) {
      name = models['name'];
    }

    if (models['age'] is int) {
      age = models['age'];
    }

    return Scaffold(
      body: Column(
        children: [
          Image.asset(Asset.LOGO_IMAGE),
          Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png'),
          Text('name: ${name}, age: ${age}'),
          TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text('back'))
        ],
      ),
    );
  }
}
