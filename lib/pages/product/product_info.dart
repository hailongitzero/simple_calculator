import 'package:flutter/material.dart';

class ProductInfors extends StatelessWidget {
  const ProductInfors({super.key, required this.infor});
  final List<String>? infor;

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: infor!
          .map((e) => Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(e,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ))
          .toList(),
    );
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}
