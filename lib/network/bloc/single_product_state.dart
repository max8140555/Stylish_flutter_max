part of 'single_product_bloc.dart';

abstract class SingleProductState {
  Product? data;

  SingleProductState(this.data);

  factory SingleProductState.initial() = SingleProductInitial;
  factory SingleProductState.loading() = SingleProductLoading;
  factory SingleProductState.success(Product? data) = SingleProductSuccess;
  factory SingleProductState.error(String e) = SingleProductError;
} 

class SingleProductInitial extends SingleProductState {
  SingleProductInitial() : super(null);
}

class SingleProductLoading extends SingleProductState {
  SingleProductLoading() : super(null);
}

class SingleProductSuccess extends SingleProductState {
  Product? newData;

  SingleProductSuccess(this.newData) : super(newData);
}

class SingleProductError extends SingleProductState {
  String errorMsg = "";

  SingleProductError(this.errorMsg) : super(null);
}