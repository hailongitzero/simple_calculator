import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/components/button/logout_icon.dart';
import 'package:simple_calculator/controllers/receipt/receipt_controller.dart';
import 'package:simple_calculator/pages/receipt/receipt_detail.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});
  static const title = 'Receipts';
  static const icon = Icon(CupertinoIcons.list_bullet);

  @override
  State<ReceiptPage> createState() => _ReceiptPage();
}

class _ReceiptPage extends State<ReceiptPage> {
  final receiptKey = GlobalKey();
  ReceiptController receiptController = Get.put(ReceiptController());

  Widget _buildBody() {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Obx(
        () {
          if (receiptController.loadInit.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return NotificationListener<ScrollNotification>(
              onNotification: (scroll) {
                if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
                  if (scroll is ScrollEndNotification) {
                    receiptController.loadMore();
                  }
                }
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: receiptController.receipts.length,
                      itemBuilder: (context, index) {
                        return ReceiptDetail(
                            receipt: receiptController.receipts[index]);
                      },
                    ),
                  ),
                  Obx(() {
                    if (receiptController.onLoading.value) {
                      return const CircularProgressIndicator();
                    } else {
                      return const SizedBox();
                    }
                  })
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: receiptKey,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Receipts'),
        trailing: LogoutIconButton(),
        previousPageTitle: '',
      ),
      child: _buildBody(),
    );
  }
}
