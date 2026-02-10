import 'package:house_of_electricity/src/features/category/domain/repositories/categories_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/repositories/product_repository.dart';

class QueryByCategoryUseCase {
  final ProductsRepository repository;
  final CategoryRepository categoryRepository;

  QueryByCategoryUseCase(this.repository, this.categoryRepository);

  Future<List<Product>> call(int categoryId, int? page) {
    final categories = categoryRepository.getSubCategories()[categoryId];
    if (categories == null || categories.isEmpty) {
      return repository.queryByCategory([categoryId], page);
    } else {
      final categoriesIds = categories.map((e) => e.id).toList();
      categoriesIds.add(categoryId);
      return repository.queryByCategory(categoriesIds, page);
    }
  }
}
