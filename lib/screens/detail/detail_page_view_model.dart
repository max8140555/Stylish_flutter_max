import 'package:flutter/material.dart';
import 'package:stylish_max/models/product.dart';

class DetailPageViewModel extends ChangeNotifier {
  Product product = Product.getDefaultProduct();

  void updateProductDetail(Product data) {
    product = data;
    notifyListeners();
  }

  Variant stock = Variant(colorCode: "", size: "", stock: 0);

  String selectedColorCode = '';

  void updateSelectColor(String colorCode) {
    selectedColorCode = colorCode;
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
    if (stock.stock > selectedQty) {
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

  Variant getStock() {
    return product.variants.firstWhere((element) => element.colorCode == selectedColorCode && element.size == selectSize);
  }
}
