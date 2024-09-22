import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:simple_calculator/model/receipt/receipt_model.dart';

class ApiReceiptService {
  final Dio _dio = Dio();
  ApiReceiptService() {
    _dio.options.baseUrl = 'https://api.spoonacular.com/';
    _dio.options.queryParameters = {
      'apiKey': '68b7b990b7764ea4a7523ad896e1b668'
    };
    _dio.interceptors.add(PrettyDioLogger());
  }
  Future<ReceiptResponse?> fetchRecipes({
    required int currentSize,
    required int skipSize,
  }) async {
    try {
      final response =
          await _dio.get('/recipes/complexSearch', queryParameters: {
        'number': currentSize,
        'offSet': skipSize,
      });
      if (response.statusCode == 200) {
        try {
          return ReceiptResponse.fromJson(
              response.data as Map<String, dynamic>);
        } catch (_) {
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
