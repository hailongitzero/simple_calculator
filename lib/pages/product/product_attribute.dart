import 'package:flutter/material.dart';
import 'package:simple_calculator/controllers/products/product_controller.dart';
import 'package:simple_calculator/model/products/product_model.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key, required this.attributeGroups});
  final List<AttributeGroups>? attributeGroups;

  Widget _buildItem() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.6),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
            vertical: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  attributeGroups[index].name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  attributeGroups?[index].value ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: attributeGroups?.length,
    );
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}
