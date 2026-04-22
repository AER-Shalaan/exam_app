import 'package:equatable/equatable.dart';

class BaseState<T> extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final T? data;

  const BaseState({
    this.isLoading = false,
    this.errorMessage,
    this.data,
  });

 
  BaseState<T> copyWith({
    bool? isLoadingParam,
    String? errorMessageParam,
    T? dataParam,
  }) {
    return BaseState<T>(
      isLoading: isLoadingParam ?? isLoading,
      errorMessage: errorMessageParam,
      data: dataParam ?? data,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        data,
      ];
}