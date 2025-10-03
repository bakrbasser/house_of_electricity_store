import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';

class RemoveFromCartUseCase {
  final CartItemsRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<void> call(int productId) {
    return repository.removeFromCart(productId);
  }
}
