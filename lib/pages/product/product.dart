import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/components/button/logout_icon.dart';
import 'package:simple_calculator/controllers/products/product_controller.dart';
import 'package:simple_calculator/pages/product/product_attribute.dart';
import 'package:simple_calculator/pages/product/product_color.dart';
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
  DetailProductController productController =
      Get.put(DetailProductController());

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

                    ///Name
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
                    Text(
                      '${productController.product.value?.prices?.first.latestPrice}đ',
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
                          '${productController.product.value?.prices?.first.supplierRetailPrice}đ   ',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '-${productController.product.value?.prices?.first.discountPercent}%',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: productController.getInfoTitleList
                          .map((e) => Container(
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child: Text(e),
                              ))
                          .toList(),
                    ),
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
                        const Text('Xem thêm nội dung'),
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
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${productController.product.value?.productDetail?.description}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 150,
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
