import 'package:flutter/material.dart';
import 'package:simple_calculator/controllers/products/product_controller.dart';

class ProductColorSelect extends StatelessWidget {
  const ProductColorSelect({super.key, required this.productController});
  final DetailProductController productController;

  Widget _buildItem() {
    return Wrap(
      children: productController
          .colorOptions()
          .map((e) => GestureDetector(
                onTap: () {
                  productController.changeColor(e ?? '');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    e ?? '',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: getColor(e)),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Color getColor(String? color) {
    switch (color) {
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Yellow':
        return Colors.yellow;
      case 'Pink':
        return Colors.pink;
      case 'Black':
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}
