part of 'product_bloc.dart';

@immutable
abstract class ProductListEvent {
  factory ProductListEvent.getProductListEvent(String category) =>
      GetProductListEvent(category: category);
}

class GetProductListEvent implements ProductListEvent {
  final String category;

  GetProductListEvent({required this.category});
}
