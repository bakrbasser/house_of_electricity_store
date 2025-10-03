import 'package:house_of_electricity/src/features/favorites/domain/repositories/favorites_repository.dart';

class GetFavoriteProductIdsUseCase {
  final FavoritesRepository repository;
  GetFavoriteProductIdsUseCase(this.repository);

  Set<int> call() {
    return repository.getFavoriteProductIds();
  }
}