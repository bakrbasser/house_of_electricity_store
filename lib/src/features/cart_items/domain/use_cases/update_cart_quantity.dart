import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';

class UpdateCartQuantityUseCase {
  final CartItemsRepository repository;

  UpdateCartQuantityUseCase(this.repository);

  Future<void> call(int productId, int quantity) {
    return repository.updateQuantity(productId, quantity);
  }
}
