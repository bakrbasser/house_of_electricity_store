import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

abstract class FavoritesRepository {
  Future<List<Product>> getFavorites();
  Future<void> addToFavorites(Product product);
  Future<void> removeFromFavorites(int productId);
  Future<void> fetchFavoriteProductIds();
  Set<int> getFavoriteProductIds();
}
