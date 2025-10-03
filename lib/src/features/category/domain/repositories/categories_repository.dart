import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<void> fetchAllCategories();
  List<Category> getAllCategories();
  Map<int, List<Category>> getSubCategories();
}
