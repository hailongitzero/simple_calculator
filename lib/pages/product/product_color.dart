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
                      color: Colors.blueAccent,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(e ?? ''),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}
