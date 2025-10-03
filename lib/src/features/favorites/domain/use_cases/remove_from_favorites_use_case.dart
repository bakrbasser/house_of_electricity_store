import 'package:house_of_electricity/src/features/favorites/domain/repositories/favorites_repository.dart';

class RemoveFromFavoritesUseCase {
  final FavoritesRepository repository;
  RemoveFromFavoritesUseCase(this.repository);

  Future<void> call(int productId) async {
    await repository.removeFromFavorites(productId);
  }
}
