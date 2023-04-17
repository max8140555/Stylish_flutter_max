part of 'single_product_bloc.dart';

abstract class SingleProductEvent {}

class GetProductEvent implements SingleProductEvent {
  final String productId;

  GetProductEvent({required this.productId});
}
