import 'package:dio/dio.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/model/response_product_list.dart';

abstract class StylishRepository {
  Future<ProductList> getProductList(String category, bool isLoadMore);
  Future<Product?> getProductDetail(String productId);
}

class StylishRepositoryImpl implements StylishRepository {
  final dio = Dio();

  Map<String, ProductList> cacheMap = {};

  @override
  Future<ProductList> getProductList(String category, bool isLoadMore) async {
    final emptyProductList = ProductList(category: "", data: [], nextPaging: null);

    String url = "";
    if (cacheMap[category] != null && isLoadMore) {
      if (cacheMap[category]?.nextPaging != null) {
        url = "https://api.appworks-school.tw/api/1.0/products/$category?paging=${cacheMap[category]?.nextPaging}";
      }
    } else if (cacheMap[category] == null) {
      url = "https://api.appworks-school.tw/api/1.0/products/$category";
    }

    if (url.isNotEmpty) {
      final response = await dio.get(url);
      var responseData = ResponseProductList.fromJson(response.data);
      var newData = ProductList(
        category: category,
        data: responseData.data?.map((it) => convertProduct(it)).toList() ?? [],
        nextPaging: responseData.nextPaging,
      );
      cacheMap[category] =
          ProductList(category: category, data: (cacheMap[category]?.data ?? []) + newData.data + newData.data, nextPaging: newData.nextPaging);
    }

    return cacheMap[category] ?? emptyProductList;
  }

  @override
  Future<Product?> getProductDetail(String productId) async {
    final response = await dio.get("https://api.appworks-school.tw/api/1.0/products/details?id=$productId");
    var responseData = ResponseProduct.fromJson(response.data);
    var newData = responseData.data != null ? convertProduct(responseData.data!) : null;
    return newData;
  }

  Product convertProduct(ResponseDatum data) {
    return Product(
      id: data.id ?? -1,
      category: data.category ?? "",
      title: data.title ?? "",
      description: data.description ?? "",
      price: data.price ?? 0,
      texture: data.texture ?? "",
      wash: data.wash ?? "",
      place: data.place ?? "",
      note: data.note ?? "",
      story: data.story ?? "",
      mainImage: data.mainImage ?? "",
      images: data.images ?? [],
      variants: data.variants
              ?.map((variant) => Variant(
                    colorCode: variant.colorCode ?? "",
                    size: variant.size?.name ?? "",
                    stock: variant.stock ?? 0,
                  ))
              .toList() ??
          [],
      colors: data.colors
              ?.map((color) => MyColor(
                    code: color.code ?? "",
                    name: color.name ?? "",
                  ))
              .toList() ??
          [],
      sizes: data.sizes?.map((size) => size.name).toList() ?? [],
    );
  }
}
