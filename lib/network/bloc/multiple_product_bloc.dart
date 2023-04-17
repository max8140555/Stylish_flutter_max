import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/repository/stylish_repository.dart';

part 'multiple_product_event.dart';
part 'multiple_product_state.dart';

class MultipleProductBloc extends Bloc<MultipleProductEvent, MultipleProductState> {
  final StylishRepository _stylishRepository;
  
  MultipleProductBloc(this._stylishRepository) : super(MultipleProductInitial()) {
    on<GetMultipleProductEvent>((event, emit) async {
      try {
        final category = event.category;
        emit(MultipleProductState.loading());
        var data = await _stylishRepository.getProductList(category, false);
        emit(MultipleProductState.success(data));
      } catch (e) {
        emit(MultipleProductState.error(e.toString()));
      }
    });
  }
}
