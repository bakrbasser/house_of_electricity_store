part of 'query_products_cubit.dart';

@immutable
sealed class QueryProductsState {}

final class QueryProductsInitial extends QueryProductsState {}

final class QueryProductsLoading extends QueryProductsState {}

final class QueryProductsEmpty extends QueryProductsState {}

final class QueryProductsSucceeded extends QueryProductsState {
  final List<Product> products;

  QueryProductsSucceeded({required this.products});
}

final class QueryProductsFailed extends QueryProductsState {
  final String message;

  QueryProductsFailed({required this.message});
}
