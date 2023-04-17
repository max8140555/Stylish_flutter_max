import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/repository/stylish_repository.dart';

part 'single_product_event.dart';
part 'single_product_state.dart';

class SingleProductBloc extends Bloc<SingleProductEvent, SingleProductState> {
  final StylishRepository _stylishRepository;

  SingleProductBloc(this._stylishRepository) : super(SingleProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      try {
        final productId = event.productId;
        emit(SingleProductState.loading());
        var data = await _stylishRepository.getProductDetail(productId);
        emit(SingleProductState.success(data));
      } catch (e) {
        emit(SingleProductState.error(e.toString()));
      }
    });
  }
}
