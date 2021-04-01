import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mystock/src/pages/home/widgets/buildDrawer.dart';
import 'package:mystock/src/pages/home/widgets/custom_tabbar.dart';
import 'package:mystock/src/viewmodels/tab_menu_view_models.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabsMenu = TabMenuViewModel().items;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsMenu.length,
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: BuildDrawer(),
        body: TabBarView(
          children: _tabsMenu.map((item) => item.widget).toList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Flutter'),
      bottom: CustomTabBar(_tabsMenu),
      actions: [
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
        IconButton(icon: Icon(Icons.qr_code), onPressed: () {}),
      ],
    );
  }
}
