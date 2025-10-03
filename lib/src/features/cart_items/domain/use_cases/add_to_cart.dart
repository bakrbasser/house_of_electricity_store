import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class AddToCartUseCase {
  final CartItemsRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call(Product product) async {
    return repository.addToCart(product);
  }
}
