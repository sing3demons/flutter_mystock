import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock/src/config/routes.dart';
import 'package:mystock/src/constants/setting.dart';
import 'package:mystock/src/viewmodels/menu_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildDrawer extends StatefulWidget {
  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(),
          ..._buildMainMenu(),
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
    );
  }

  UserAccountsDrawerHeader _buildProfile() => UserAccountsDrawerHeader(
        accountName: Text("KP sing"),
        accountEmail: Text('sing@dev.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png'),
        ),
      );

  List<ListTile> _buildMainMenu() => MenuViewModle()
      .items
      .map(
        (item) => ListTile(
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          leading: Badge(
            showBadge: item.icon == FontAwesomeIcons.inbox,
            badgeContent: Text(
              '99',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            badgeColor: Colors.red,
            child: FaIcon(
              item.icon,
              color: item.iconColor,
            ),
          ),
          onTap: () => item.onTap(context),
        ),
      )
      .toList();
}
