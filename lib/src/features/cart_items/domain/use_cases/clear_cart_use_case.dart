import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';

class ClearCartUseCase {
  final CartItemsRepository repository;

  ClearCartUseCase(this.repository);

  Future<void> call() {
    return repository.clearCart();
  }
}
