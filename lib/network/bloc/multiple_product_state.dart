part of 'multiple_product_bloc.dart';

abstract class MultipleProductState {
  ProductList? data;
  
  MultipleProductState(this.data);

  factory MultipleProductState.initial() = MultipleProductInitial;
  factory MultipleProductState.loading() = MultipleProductLoading;
  factory MultipleProductState.success(ProductList? data) = MultipleProductSuccess;
  factory MultipleProductState.error(String e) = MultipleProductError;
}

class MultipleProductInitial extends MultipleProductState {
  MultipleProductInitial() : super(null);
}

class MultipleProductLoading extends MultipleProductState {
  MultipleProductLoading() : super(null);
}

class MultipleProductSuccess extends MultipleProductState {
  ProductList? newData;

  MultipleProductSuccess(this.newData) : super(newData);
}

class MultipleProductError extends MultipleProductState {
  String errorMsg = "";

  MultipleProductError(this.errorMsg) : super(null);
}
