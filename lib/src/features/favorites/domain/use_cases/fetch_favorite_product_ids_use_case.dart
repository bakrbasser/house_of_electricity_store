import 'package:house_of_electricity/src/features/favorites/domain/repositories/favorites_repository.dart';

class FetchFavoriteProductIdsUseCase {
  final FavoritesRepository repository;
  FetchFavoriteProductIdsUseCase(this.repository);

  Future<void> call() async {
    await repository.fetchFavoriteProductIds();
  }
}
