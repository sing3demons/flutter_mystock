import 'package:flutter/material.dart';
import 'package:mystock/src/constants/asset.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 38),
      child: Image.asset(
        Asset.LOGO_IMAGE,
        height: 80,
      ),
    );
  }
}