import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/domain/repositories/categories_repository.dart';

class GetSubcategoriesUseCase {
  final CategoryRepository repository;

  GetSubcategoriesUseCase(this.repository);

  Map<int, List<Category>> call() {
    return repository.getSubCategories();
  }
}
