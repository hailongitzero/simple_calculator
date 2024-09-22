import 'package:get/get.dart';
import 'package:simple_calculator/model/products/product_model.dart';
import 'package:simple_calculator/services/product_service.dart';

class DetailProductController extends GetxController {
  Rx<Product?> product = Rxn<Product>();

  RxBool isLoading = false.obs;
  RxString titleColor = ''.obs;
  RxString titleSizeMemory = ''.obs;

  final ApiProductService service = ApiProductService();

  // List<AttributeGroups> attributes = [];

  List<String> getInfoTitleList = [];
  List<String> imageCarousel = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await service.fetchProduct();
    getInfoTitle();
    // getAttributes();
    getImageCarousel();
  }

  void changeColor(String value) {
    titleColor.value = value;
  }

  void changeSize(String value) {
    titleSizeMemory.value = value;
  }

  List<String?> colorOptions() {
    List<String?> colorOptions = product.value?.productOptions?.rows?[1].options
            ?.map((e) => e.label)
            .toList() ??
        [];

    return colorOptions;
  }

  void getInfoTitle() {
    getInfoTitleList =
        product.value?.productDetail?.shortDescription?.split('<br/>') ?? [];
  }

  // void getAttributes() {
  //   attributes = product.value?.productDetail?.attributeGroups ?? [];
  // }

  void getImageCarousel() {
    imageCarousel = product.value?.productDetail?.images
            ?.map((e) => e.url ?? '')
            .toList() ??
        [];
  }

  List<String?> sizeMemory() {
    final List<String?> sizeMemories = product
            .value?.productOptions?.rows?[0].options
            ?.map((e) => e.label)
            .toList() ??
        [];
    return sizeMemories;
  }

  Future<void> getDetailProduct() async {
    isLoading.value = true;

    try {
      final Product? response = await service.fetchProduct();
      if (response == null) {
        product.value = Product.fromJson(response as Map<String, dynamic>);
        isLoading.value = false;
        // update();
      } else {
        isLoading.value = false;
        Get.snackbar('Error Loading data!', 'Sever responded: load error');
      }
    } catch (error) {
      isLoading.value = false;
      Get.snackbar('Error Loading data!', 'error occurs');
    }
  }
}
