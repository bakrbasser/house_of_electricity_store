part of 'products_list_cubit.dart';

@immutable
sealed class HomeProductsListState {}

final class ProductsListInitial extends HomeProductsListState {}

final class ProductsListFull extends HomeProductsListState {
  final List<Product> products;
  ProductsListFull({required this.products});
}

final class ProductsLisEmpty extends HomeProductsListState {
  ProductsLisEmpty();
}

final class ProductsListLoading extends HomeProductsListState {}

final class ProductsListFailed extends HomeProductsListState {
  final String message;

  ProductsListFailed({required this.message});
}
