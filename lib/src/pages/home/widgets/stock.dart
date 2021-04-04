import 'package:flutter/material.dart';
import 'package:mystock/src/pages/home/widgets/product_item.dart';

class Stock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _spacing = 4.0;
    return GridView.builder(
      padding: EdgeInsets.only(
        right: _spacing,
        left: _spacing,
        top: _spacing,
        bottom: 150,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
      ),
      itemBuilder: (context, index) => LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return ProductItem(constraints.maxHeight);
        },
      ),
      itemCount: 5,
    );
  }
}
