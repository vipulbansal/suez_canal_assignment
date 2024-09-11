import 'dart:io';

abstract class DataState<T> {
  final T? data;
  final HttpException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataSuccessWithFail<T> extends DataState<T> {
  const DataSuccessWithFail(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(HttpException error) : super(error: error);
}
