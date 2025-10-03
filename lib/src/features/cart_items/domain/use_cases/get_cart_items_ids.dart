import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';

class GetCartItemsIdsUseCase {
  final CartItemsRepository repository;

  GetCartItemsIdsUseCase(this.repository);

  Set<int> call() {
    return repository.getCartItemsIds();
  }
}
