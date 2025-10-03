import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/add_to_cart.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/get_cart_items_ids.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/remove_from_cart.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:meta/meta.dart';

part 'cart_items_operations_state.dart';

class CartItemsOperationsCubit extends Cubit<CartItemsOperationsState> {
  final AddToCartUseCase _addToCart;
  final RemoveFromCartUseCase _removeFromCart;
  final GetCartItemsIdsUseCase _getCartItemsIdsUseCase;

  CartItemsOperationsCubit({
    required GetCartItemsIdsUseCase getCartItemsIdsUseCase,
    required AddToCartUseCase addToCart,
    required RemoveFromCartUseCase removeFromCart,
  }) : _addToCart = addToCart,
       _removeFromCart = removeFromCart,
       _getCartItemsIdsUseCase = getCartItemsIdsUseCase,
       super(CartItemsOperationsInitial());

  Future<void> addItem(Product product) async {
    try {
      await _addToCart(product);
    } catch (e) {
      emit(CartItemsOperationsFailed(e.toString()));
    }
  }

  Future<void> removeItem(int productId) async {
    try {
      await _removeFromCart(productId);
    } catch (e) {
      emit(CartItemsOperationsFailed(e.toString()));
    }
  }

  bool isCartItem(int id) => _getCartItemsIdsUseCase.call().contains(id);
}
