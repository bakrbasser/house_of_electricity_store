import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/entities/cart_product.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/clear_cart_use_case.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/get_cart_items.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/remove_from_cart.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/update_cart_quantity.dart';
import 'package:meta/meta.dart';

part 'cart_items_state.dart';

class CartItemsCubit extends Cubit<CartItemsState> {
  final GetCartItemsUseCase _getCartItems;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final UpdateCartQuantityUseCase _updateQuantity;
  final ClearCartUseCase _clearCart;

  CartItemsCubit({
    required GetCartItemsUseCase getCartItems,
    required UpdateCartQuantityUseCase updateQuantity,
    required ClearCartUseCase clearCart,
    required RemoveFromCartUseCase removeFromCartUseCase,
  }) : _clearCart = clearCart,
       _updateQuantity = updateQuantity,
       _removeFromCartUseCase = removeFromCartUseCase,
       _getCartItems = getCartItems,
       super(CartItemsInitial());

  double _totalPrice = 0;

  final totalPriceStream = StreamController<double>();

  Future<void> fetchCartItems() async {
    emit(CartItemsLoading());
    try {
      final cartProducts = await _getCartItems();
      _fillPrice(cartProducts);
      if (cartProducts.isEmpty) {
        emit(CartItemsEmpty());
      } else {
        emit(CartItemsHasData(cartProducts: cartProducts));
      }
    } catch (e) {
      emit(CartItemsFailed(e.toString()));
    }
  }

  Future<void> removeFromCart(CartProduct product) async {
    try {
      await _removeFromCartUseCase.call(product.product.id);
      _totalPrice -= product.totalPrice;
      _podcastPrice();
    } catch (e) {
      emit(CartItemsFailed(e.toString()));
    }
  }

  Future<void> addToItemQuantity(CartProduct cartProduct, int quantity) async {
    try {
      await _updateQuantity(cartProduct.product.id, quantity);
      _totalPrice += cartProduct.product.price;
      _podcastPrice();
    } catch (e) {
      emit(CartItemsFailed(e.toString()));
    }
  }

  Future<void> decreaseItemQuantity(
    CartProduct cartProduct,
    int quantity,
  ) async {
    try {
      await _updateQuantity(cartProduct.product.id, quantity);
      _totalPrice -= cartProduct.product.price;
      _podcastPrice();
    } catch (e) {
      emit(CartItemsFailed(e.toString()));
    }
  }

  Future<void> clearCartItems() async {
    try {
      await _clearCart();
    } catch (e) {
      emit(CartItemsFailed(e.toString()));
    }
  }

  void _fillPrice(List<CartProduct> list) {
    for (var element in list) {
      _totalPrice = _totalPrice + element.totalPrice;
    }
    _podcastPrice();
  }

  void _podcastPrice() {
    totalPriceStream.sink.add(_totalPrice);
  }
}
