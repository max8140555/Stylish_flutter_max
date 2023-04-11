part of 'product_bloc.dart';

@immutable
abstract class ProductDetailEvent {
  factory ProductDetailEvent.getProductDetailEvent(String productId) =>
      GetProductDetailEvent(productId: productId);
}

class GetProductDetailEvent implements ProductDetailEvent {
  final String productId;

  GetProductDetailEvent({required this.productId});
}
