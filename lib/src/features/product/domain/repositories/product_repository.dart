import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getHomePageProducts(int page);
  Future<List<Product>> queryByName(String query);
  Future<List<Product>> queryByCategory(List<int> categoriesId, int? page);
}
