import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock/src/config/routes.dart';

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;

  const Menu(this.title, {this.icon, this.iconColor, this.onTap});
}

class MenuViewModle {
  List<Menu> get items => <Menu>[
        Menu(
          'Profile',
          icon: FontAwesomeIcons.users,
          iconColor: Colors.deepOrange,
          onTap: (context) {},
        ),
        Menu(
          'Dashboard',
          icon: FontAwesomeIcons.chartPie,
          iconColor: Colors.green,
          onTap: (context) {
            Navigator.pushNamed(context, Routes.dashboard);
          },
        ),
        Menu(
          'Inbox',
          icon: FontAwesomeIcons.inbox,
          iconColor: Colors.amber,
          onTap: (context) {},
        ),
        Menu(
          'Settings',
          icon: FontAwesomeIcons.cogs,
          iconColor: Colors.blueGrey,
          onTap: (context) {},
        ),
      ];
}
