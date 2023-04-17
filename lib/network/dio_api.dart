import 'package:dio/dio.dart';
import 'package:stylish_max/network/model/response_product_list.dart';

class DioApi {
  final dio = Dio();
  static const host = 'https://api.appworks-school.tw';
  static const apiVersion = '1.0';
  static const url = '$host/api/$apiVersion';

  Future<ResponseProductList> getProductList(String category, int? paging) async {
    String newUrl;
    if (paging == null) {
      newUrl = "$url/products/$category";
    } else {
      newUrl = "$url/products/$category?paging=$paging";
    }
    final response = await dio.get(newUrl);
    return ResponseProductList.fromJson(response.data);
  }

  Future<ResponseProduct> getSingleProduct(String productId) async {
    final response = await dio.get("$url/products/details?id=$productId");
    return ResponseProduct.fromJson(response.data);
  }
}
