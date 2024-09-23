import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/components/button/logout_icon.dart';
import 'package:simple_calculator/controllers/products/product_controller.dart';
import 'package:simple_calculator/pages/product/product_attribute.dart';
import 'package:simple_calculator/pages/product/product_color.dart';
import 'package:simple_calculator/pages/product/product_info.dart';
import 'package:simple_calculator/pages/product/product_prices.dart';
import 'package:simple_calculator/pages/product/product_size.dart';
import 'package:simple_calculator/pages/product/product_slider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  static const title = 'Product';
  static const icon = Icon(CupertinoIcons.archivebox);

  @override
  State<ProductPage> createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  final productKey = GlobalKey();
  late DetailProductController productController;

  @override
  void initState() {
    super.initState();
    productController = Get.put(DetailProductController());
  }

  Widget _buildBody() {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Obx(() => productController.isLoading.value == true
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Carousel Slider UI
                    ProductImageSlide(
                        imageCarousel: productController.imageCarousel),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Màu sắc: ${productController.titleColor}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    ProductColorSelect(productController: productController),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Dung lượng: ${productController.titleSizeMemory}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    ProductSizeSelect(productController: productController),

                    Text(
                      productController.product.value?.productInfo?.name ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),
                    ProductPriceSelect(
                        prices: productController.product.value?.prices),

                    const SizedBox(
                      height: 6,
                    ),

                    ProductInfors(infor: productController.getInfoTitleList),

                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      'Chi tiết sản phẩm',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),

                    ProductAttribute(
                        attributeGroups: productController
                            .product.value?.productDetail?.attributeGroups),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Xem thêm nội dung',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: const Icon(Icons.expand_more),
                          onPressed: () {},
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 6,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mô tả sản phẩm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    HtmlWidget(
                      productController
                              .product.value?.productDetail!.description ??
                          "",
                      textStyle:
                          const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FloatingActionButton(
                          // Change icon as needed
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          mini: true, // Make it smaller (optional)
                          child: const Text(
                            'Liên Hệ',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () => {}),
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: productKey,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Products'),
        trailing: LogoutIconButton(),
        previousPageTitle: '',
      ),
      child: _buildBody(),
    );
  }
}
