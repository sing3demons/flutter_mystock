import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock/src/viewmodels/single_sign_on_view_model.dart';

class SingleSignOn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider(),
        SizedBox(height: 12),
        _buildSingleSignOnButton(),
      ],
    );
  }

  Padding _buildSingleSignOnButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: SingleSignOnViewModel()
              .items
              .map(
                (item) => FloatingActionButton(
                  heroTag: item.icon.toString(),
                  onPressed: item.onPress,
                  backgroundColor: item.backgroundColor,
                  child: FaIcon(
                    item.icon,
                    color: Colors.white,
                  ),
                ),
              )
              .toList(),
        ),
      );
}

Row _buildDivider() {
  final gradientColor = const [Colors.white10, Colors.white];
  final line = (List<Color> colors) => Container(
        width: 80,
        height: 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 1.0],
          ),
        ),
      );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      line(gradientColor),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          'or',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 16,
          ),
        ),
      ),
      line(gradientColor.reversed.toList()),
    ],
  );
}
