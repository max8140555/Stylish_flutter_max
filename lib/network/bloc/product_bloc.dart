// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:stylish_max/models/product_detail.dart';
import 'package:stylish_max/network/api_state.dart';
import 'package:stylish_max/network/repository/product_repository.dart';

part 'product_event.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ApiState<ProductDetail>> {
  final ProductRepository _productRepository;

  ProductDetailBloc(this._productRepository) : super(ApiState.initial()) {
    on<ProductDetailEvent>((event, emit) async {
      try {
            final getProductDetailEvent = event as GetProductDetailEvent;
            final productId = getProductDetailEvent.productId;
            emit(ApiState.loading());
            var data = await _productRepository.getProductDetail(productId);

            await Future.delayed(const Duration(seconds: 3)); // 添加3秒延迟

            emit(ApiState.success(data));
          
      } catch (e) {
        emit(ApiState.error(e.toString()));
      }
    });
  }
}
