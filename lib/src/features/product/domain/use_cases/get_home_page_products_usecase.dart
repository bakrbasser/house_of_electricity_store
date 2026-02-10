import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/repositories/product_repository.dart';

class GetHomePageProductsUseCase {
  final ProductsRepository repository;

  GetHomePageProductsUseCase(this.repository);

  Future<List<Product>> call(int page) {
    return repository.getHomePageProducts(page);
  }
}
