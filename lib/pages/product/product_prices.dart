import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_calculator/model/products/product_model.dart';

class ProductPriceSelect extends StatelessWidget {
  ProductPriceSelect({super.key, required this.prices});
  final List<Prices>? prices;
  final oCcy = NumberFormat("#,##0", "vi-VN");

  Widget _buildItem() {
    return Wrap(children: [
      Text(
        '${oCcy.format(int.parse(prices!.first.latestPrice ?? "0"))} đ',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.blueAccent,
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      Row(
        children: [
          Text(
            '${oCcy.format(int.parse(prices?.first.supplierRetailPrice ?? "0"))} đ   ',
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            '-${prices?.first.discountPercent}%',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    ]);
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}
