import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/repositories/product_repository.dart';

class LocalProductsRepository implements ProductsRepository {
  @override
  Future<List<Product>> getHomePageProducts(int page) {
    // TODO: implement getHomePageProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> queryByCategory(List<int> categoriesId, int? page) {
    // TODO: implement queryByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> queryByName(String query) {
    // TODO: implement queryByName
    throw UnimplementedError();
  }
}
