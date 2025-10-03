import 'package:house_of_electricity/src/features/cart_items/domain/entities/cart_product.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';

class GetCartItemsUseCase {
  final CartItemsRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<List<CartProduct>> call() {
    return repository.getCartItems();
  }
}
