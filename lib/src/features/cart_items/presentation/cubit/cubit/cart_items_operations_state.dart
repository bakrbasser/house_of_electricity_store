part of 'cart_items_operations_cubit.dart';

@immutable
sealed class CartItemsOperationsState {}

final class CartItemsOperationsInitial extends CartItemsOperationsState {}

final class CartItemsOperationsFailed extends CartItemsOperationsState {
  final String message;

  CartItemsOperationsFailed(this.message);
}
