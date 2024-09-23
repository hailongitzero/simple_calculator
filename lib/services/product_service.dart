import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:simple_calculator/model/products/product_model.dart';

class ApiProductService {
  final Dio _dio = Dio();
  ApiProductService() {
    _dio.options.baseUrl = 'https://discovery.tekoapis.com';
    _dio.interceptors.add(PrettyDioLogger());
  }
  Future<Product?> fetchProduct() async {
    try {
      final response = await _dio.get(
          '/api/v1/product?productld=535038&sku=230900684&location=&terminalCode=phongvu');
      if (response.statusCode == 200) {
        try {
          DetailProductTotalModel detail = DetailProductTotalModel.fromJson(
              response.data as Map<String, dynamic>);
          return detail.result?.product;
        } catch (e) {
          print(e);
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
