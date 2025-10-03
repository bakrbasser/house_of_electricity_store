import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/domain/repositories/categories_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  List<Category> call() {
    return repository.getAllCategories();
  }
}
