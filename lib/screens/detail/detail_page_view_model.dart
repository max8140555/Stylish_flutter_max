import 'package:flutter/material.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/models/product_detail.dart';
import 'package:stylish_max/models/stock.dart';
import 'package:stylish_max/screens/detail/model/calculate_qty_strategy.dart';

class DetailPageViewModel extends ChangeNotifier {
  ProductDetail productDetail = ProductDetail();

  void updateProductDetail(Product? product) {
    productDetail = ProductDetail(
        productId: "1",
        title: "UNIQLO",
        price: 323,
        imageUrl: 'assets/images/home_banner_image.jpeg',
        colors: [0xFFFFFFFF, 0xFF808080, 0xFF000000],
        sizes: ["S", "M", "L"],
        stocks: [
          Stock(0xFFFFFFFF, "S", 1),
          Stock(0xFFFFFFFF, "M", 2),
          Stock(0xFFFFFFFF, "L", 3),
          Stock(0xFF000000, "S", 1),
        ],
        description:
            "<p>實品顏色依單品照為主<br>棉 100%<br>厚薄：薄<br>彈性：無<br>素材產地 / 日本<br>加工產地 / 中國</p>",
        detailMsg:
            "O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.",
        detailImages: [
          'assets/images/home_banner_image.jpeg',
          'assets/images/home_banner_image.jpeg',
          'assets/images/home_banner_image.jpeg'
        ]);

    notifyListeners();
  }

  int? selectColorInt = null;

  void updateSelectColor(int colorInt) {
    selectColorInt = colorInt;
    stock = getStock();
    notifyListeners();
  }
  Stock? stock = null;
  String selectSize = '';

  void updateSelectSize(String size) {
    selectSize = size;
    stock = getStock();
    notifyListeners();
  }

  int selectQty = 0;

  void updateSelectQty(CalculateQtyStrategy strategy) {
    if (stock == null || stock?.stockQty == selectQty || selectQty == 0) {
      selectQty = 0;
    } else {
      if (strategy.runtimeType == Plus) {
        selectQty++;
      } else {
        selectQty--;
      }
    }

    notifyListeners();
  }

  Stock? getStock() {
    for (int i = 0; i < productDetail.stocks.length; i++) {
      Stock stock = productDetail.stocks[i];
      if (stock.color == selectColorInt && stock.size == selectSize) {
        return stock;
      }
    }
    return null;
  }
}
