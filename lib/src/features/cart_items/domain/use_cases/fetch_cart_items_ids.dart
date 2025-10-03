import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';

class FetchCartItemsIds {
  final CartItemsRepository repository;

  FetchCartItemsIds(this.repository);

  Future<void> call() {
    return repository.fetchCartItemsIds();
  }
}
