// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/api_state.dart';
import 'package:stylish_max/network/repository/stylish_repository.dart';

part 'product_event.dart';

class ProductListBloc extends Bloc<ProductListEvent, ApiState<ProductList>> {
  final StylishRepository _stylishRepository;

  ProductListBloc(this._stylishRepository) : super(ApiState.initial()) {
    on<ProductListEvent>((event, emit) async {
      try {
            final getProductDetailEvent = event as GetProductListEvent;
            final category = getProductDetailEvent.category;
            emit(ApiState.loading());
            var data = await _stylishRepository.getProductList(category);
            emit(ApiState.success(data));
          
      } catch (e) {
        emit(ApiState.error(e.toString()));
      }
    });
  }
}
