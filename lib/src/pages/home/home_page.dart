import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock/src/config/routes.dart';
import 'package:mystock/src/constants/asset.dart';
import 'package:mystock/src/constants/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Spacer(),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.grey,
              ),
              title: Text('Logout'),
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text('title'),
                      content: Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(); // Dismiss alert dialog
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text('Logout'),
                          onPressed: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.remove(Setting.TOKEN_PREF);
                            Navigator.of(dialogContext).pop();

                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.login,
                                (route) => false); // Dismiss alert dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Image.asset(Asset.LOGO_IMAGE),
    );
  }
}
