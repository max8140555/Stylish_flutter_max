import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_detail.dart';
import 'package:stylish_max/models/stock.dart';

class DetailPageViewModel extends ChangeNotifier {
  ProductDetail productDetail = ProductDetail();

  void updateProductDetail(String? productId) {
    productDetail = ProductDetail(
        productId: productId ?? "",
        title: "UNIQLO 直男衣",
        price: 323,
        imageUrl: 'assets/images/home_banner_image.jpeg',
        colors: [0xFFFFFFFF, 0xFF808080, 0xFF000000],
        sizes: ["S", "M", "L"],
        stocks: [
          Stock(0xFFFFFFFF, "S", 1),
          Stock(0xFFFFFFFF, "M", 2),
          Stock(0xFFFFFFFF, "L", 3),
          Stock(0xFF000000, "S", 0),
          Stock(0xFF000000, "M", 0),
          Stock(0xFF000000, "L", 0),
          Stock(0xFF808080, "S", 1),
          Stock(0xFF808080, "M", 5),
          Stock(0xFF808080, "L", 3),
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

  Stock stock = Stock(0, "", 0);

  int? selectedColorInt;

  void updateSelectColor(int colorInt) {
    selectedColorInt = colorInt;
    notifyListeners();
    getStockAndResetQty();
  }

  String selectSize = '';

  void updateSelectSize(String size) {
    selectSize = size;
    notifyListeners();
    getStockAndResetQty();
  }

  int selectedQty = 0;

  void resetQty() {
    selectedQty = 0;
  }

  addQty() {
    if (stock.stockQty > selectedQty) {
      selectedQty++;
      notifyListeners();
    }
  }

  minusQty() {
    if (selectedQty > 0) {
      selectedQty--;
      notifyListeners();
    }
  }

  void getStockAndResetQty() {
    stock = getStock();
    resetQty();
    notifyListeners();
  }

  Stock getStock() {
    return productDetail.stocks.firstWhere((element) =>
        element.color == selectedColorInt && element.size == selectSize);
  }
}
