import 'package:get/get.dart';
import 'package:simple_calculator/model/receipt/receipt_model.dart';
import 'package:simple_calculator/services/receipt_service.dart';

class ReceiptController extends GetxController {
  List<Receipt> receipts = <Receipt>[].obs();
  RxBool loadInit = false.obs;
  RxBool onLoading = false.obs;
  int pageSize = 4;
  int pageNo = 0;
  int? totalSize;

  final ApiReceiptService service = ApiReceiptService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getRecipes();
  }

  Future<void> getRecipes({
    bool isLoadMore = false,
  }) async {
    if (receipts.isEmpty) {
      loadInit.value = true;
    }
    if (isLoadMore) {
      onLoading.value = true;
      pageNo += 1;
    }

    final ReceiptResponse? response = await service.fetchRecipes(
      currentSize: pageSize,
      skipSize: pageNo * pageSize,
    );
    if (response == null) {
      Get.snackbar('Error Loading data!', 'Reload');
    } else {
      totalSize = response.totalResults ?? 0;
      receipts.addAll(response.results ?? []);
      if ((response.totalResults ?? 0) > 0) {
        pageNo += 1;
      }
      loadInit.value = false;
      isLoadMore = false;
    }
  }

  Future<void> loadMore() async {
    if (receipts.length < (totalSize ?? 0)) {
      await getRecipes(isLoadMore: true);
    } else {}
  }
}
