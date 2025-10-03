import 'package:house_of_electricity/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repository;
  GetFavoritesUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getFavorites();
  }
}
