import 'package:dio/dio.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/model/response_product_list.dart';

abstract class StylishRepository {
  Future<ProductList> getProductList(String category);
}

class StylishRepositoryImpl implements StylishRepository {
  final dio = Dio();

  final emptyProductList = ProductList(category: "", data: [], nextPaging: null);
  Map<String, ProductList> cacheMap = {};

  @override
  Future<ProductList> getProductList(String category) async {
    final response = await dio
        .get("https://api.appworks-school.tw/api/1.0/products/$category");
    var responseData = ResponseProductList.fromJson(response.data);
    var newData = ProductList(
      category: category,
      data: responseData.data
              ?.map((it) => Product(
                    id: it.id ?? -1,
                    category: it.category ?? "",
                    title: it.title ?? "",
                    description: it.description ?? "",
                    price: it.price ?? 0,
                    texture: it.texture ?? "",
                    wash: it.wash ?? "",
                    place: it.place ?? "",
                    note: it.note ?? "",
                    story: it.story ?? "",
                    mainImage: it.mainImage ?? "",
                    images: it.images ?? [],
                    variants: it.variants
                            ?.map((variant) => Variant(
                                  colorCode: variant.colorCode ?? "",
                                  size: variant.size?.toString() ?? "",
                                  stock: variant.stock ?? 0,
                                ))
                            .toList() ??
                        [],
                    colors: it.colors
                            ?.map((color) => Color(
                                  code: color.code ?? "",
                                  name: color.name ?? "",
                                ))
                            .toList() ??
                        [],
                    sizes:
                        it.sizes?.map((size) => size.toString()).toList() ?? [],
                  ))
              .toList() ??
          [],
      nextPaging: responseData.nextPaging,
    );

    print("Max123 $response");
    cacheMap[category] = ProductList(
        category: category,
        data: (cacheMap[category]?.data ?? []) + newData.data + newData.data + newData.data,
        nextPaging: newData.nextPaging);

    return cacheMap[category] ?? emptyProductList;
    // return ProductDetail(
    //     productId: productId,
    //     title: "UNIQLO 直男衣",
    //     price: 323,
    //     imageUrl: 'assets/images/home_banner_image.jpeg',
    //     colors: [0xFFFFFFFF, 0xFF808080, 0xFF000000],
    //     sizes: ["S", "M", "L"],
    //     stocks: [
    //       Stock(0xFFFFFFFF, "S", 1),
    //       Stock(0xFFFFFFFF, "M", 2),
    //       Stock(0xFFFFFFFF, "L", 3),
    //       Stock(0xFF000000, "S", 0),
    //       Stock(0xFF000000, "M", 0),
    //       Stock(0xFF000000, "L", 0),
    //       Stock(0xFF808080, "S", 1),
    //       Stock(0xFF808080, "M", 5),
    //       Stock(0xFF808080, "L", 3),
    //     ],
    //     description:
    //         "<p>實品顏色依單品照為主<br>棉 100%<br>厚薄：薄<br>彈性：無<br>素材產地 / 日本<br>加工產地 / 中國</p>",
    //     detailMsg:
    //         "O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.",
    //     detailImages: [
    //       'assets/images/home_banner_image.jpeg',
    //       'assets/images/home_banner_image.jpeg',
    //       'assets/images/home_banner_image.jpeg'
    //     ]);
  }
}
