import 'package:house_of_electricity/src/core/consts/database_consts.dart';
import 'package:house_of_electricity/src/core/error_handler/error_handler.dart';
import 'package:house_of_electricity/src/features/category/data/models/category_model.dart';
import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/domain/repositories/categories_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCategoriesRepository implements CategoryRepository {
  final SupabaseClient _client;

  final List<Category> _categories = [];
  final Map<int, List<Category>> _subCategories = {};

  SupabaseCategoriesRepository({required SupabaseClient client})
    : _client = client;
  @override
  Future<void> fetchAllCategories() async {
    final categories = await guardCall(
      call: () => _client.from(tableName(Tables.categories)).select(),
    );
    final categoriesList = categories
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    _distributeCategories(categoriesList);
  }

  void _distributeCategories(List<Category> categories) {
    for (var element in categories) {
      if (element.parentId == null) {
        _categories.add(element);
      } else {
        _subCategories.putIfAbsent(element.parentId!, () => []);
        _subCategories[element.parentId]!.add(element);
      }
    }
  }

  @override
  List<Category> getAllCategories() => List.unmodifiable(_categories);

  @override
  Map<int, List<Category>> getSubCategories() =>
      Map.unmodifiable(_subCategories);
}
