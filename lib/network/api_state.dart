abstract class ApiState<T> {
  T? data;

  ApiState(this.data);

  factory ApiState.initial() = ApiInitialState;
  factory ApiState.loading() = ApiLoadingState;
  factory ApiState.success(T data) = ApiSuccessState;
  factory ApiState.error(String e) = ApiErrorState;
}

class ApiInitialState<T> extends ApiState<T> {
  ApiInitialState() : super(null);
}

class ApiLoadingState<T> extends ApiState<T> {
  ApiLoadingState() : super(null);
}

class ApiSuccessState<T> extends ApiState<T> {
  T? newData;

  ApiSuccessState(this.newData) : super(newData);
}

class ApiErrorState<T> extends ApiState<T> {
  String errorMsg = "";

  ApiErrorState(this.errorMsg) : super(null);
}