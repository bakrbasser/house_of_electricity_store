import 'package:house_of_electricity/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class AddToFavoritesUseCase {
  final FavoritesRepository repository;
  AddToFavoritesUseCase(this.repository);

  Future<void> call(Product product) async {
    await repository.addToFavorites(product);
  }
}