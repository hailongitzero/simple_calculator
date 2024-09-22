import 'package:flutter/material.dart';
import 'package:simple_calculator/model/receipt/receipt_model.dart';

class ReceiptDetail extends StatelessWidget {
  const ReceiptDetail({super.key, rec, required this.receipt});
  final Receipt receipt;

  Widget _buildItem() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0), // Add padding for content
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5.0), // Rounded corners
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(receipt.image!),
            height: 200,
            width: 200,
          ),
          Text(receipt.title!,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 78, 78, 78),
                  decoration: TextDecoration.none)),
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}
