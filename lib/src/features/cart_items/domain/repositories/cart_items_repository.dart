import 'package:house_of_electricity/src/features/cart_items/domain/entities/cart_product.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

abstract class CartItemsRepository {
  Future<void> fetchCartItemsIds();
  Set<int> getCartItemsIds();
  Future<List<CartProduct>> getCartItems();
  Future<void> addToCart(Product product);
  Future<void> removeFromCart(int productId);
  Future<void> updateQuantity(int productId, int quantity);
  Future<void> clearCart();
}
