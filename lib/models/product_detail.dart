import 'package:stylish_max/models/stock.dart';

class ProductDetail {
  final String productId;
  final String title;
  final double price;
  final String imageUrl;
  final List<int> colors;
  final List<String> sizes;
  final List<Stock> stocks;
  final String description;
  final String detailMsg;
  final List<String> detailImages;

  ProductDetail(
      { this.productId = "",
       this.title = "",
       this.price = double.nan,
       this.imageUrl = "",
       this.colors = const[],
       this.sizes = const[],
       this.stocks = const[],
       this.description = "",
       this.detailMsg = "",
       this.detailImages = const[]});
}
