part of 'cart_items_cubit.dart';

@immutable
sealed class CartItemsState {}

final class CartItemsInitial extends CartItemsState {}

final class CartItemsHasData extends CartItemsState {
  final List<CartProduct> cartProducts;

  CartItemsHasData({required this.cartProducts});
}

final class CartItemsEmpty extends CartItemsState {}

final class CartItemsLoading extends CartItemsState {}

final class CartItemsFailed extends CartItemsState {
  final String message;

  CartItemsFailed(this.message);
}
