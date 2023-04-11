import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_detail.dart';
import 'package:stylish_max/models/stock.dart';

class DetailPageViewModel extends ChangeNotifier {
  ProductDetail productDetail = ProductDetail();

  void updateProductDetail(ProductDetail? productDetail) {
    productDetail = productDetail;
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
