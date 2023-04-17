part of 'multiple_product_bloc.dart';

@immutable
abstract class MultipleProductEvent {
  factory MultipleProductEvent.getProductListEvent(String category) => GetMultipleProductEvent(category: category);
}

class GetMultipleProductEvent implements MultipleProductEvent {
  final String category;

  GetMultipleProductEvent({required this.category});
}
