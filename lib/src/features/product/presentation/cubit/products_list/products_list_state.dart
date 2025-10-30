part of 'products_list_cubit.dart';

@immutable
sealed class ProductsListState {}

final class ProductsListInitial extends ProductsListState {}

final class ProductsListFull extends ProductsListState {
  final List<Product> products;
  ProductsListFull({required this.products});
}

final class ProductsLisEmpty extends ProductsListState {
  ProductsLisEmpty();
}

final class ProductsListLoading extends ProductsListState {}

final class ProductsListFailed extends ProductsListState {
  final String message;

  ProductsListFailed({required this.message});
}
