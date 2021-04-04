import 'package:flutter/material.dart';
import 'package:mystock/src/utils/format.dart';
import 'package:mystock/src/widgets/image_not_found.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;

  const ProductItem(this.maxHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tab');
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildImage(),
            _buildInfo(),
          ],
        ),
      ),
    );
  }

  _buildImage() {
    final height = maxHeight * 0.7;
    final productImage =
        'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png';
    final stock = 1;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: productImage != null && productImage.isNotEmpty
              ? Image.network(productImage)
              : ImageNotFound(),
        ),
        if (stock <= 0) _buildOutOfStock(),
      ],
    );
  }

  Expanded _buildInfo() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit There is no one who loves pain itself",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '฿${formatCurrency.format(1520)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${formatNumber.format(99)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  _buildOutOfStock() {
    return Positioned(
      top: 1,
      right: 1,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'out of stock',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
