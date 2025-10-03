import 'package:house_of_electricity/src/core/calculate_pagination.dart';
import 'package:house_of_electricity/src/core/consts/database_consts.dart';
import 'package:house_of_electricity/src/core/error_handler/error_handler.dart';
import 'package:house_of_electricity/src/features/product/data/models/product_model.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/repositories/product_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProductsRepository implements ProductRepository {
  final SupabaseClient _client;

  SupabaseProductsRepository({required SupabaseClient client})
    : _client = client;

  @override
  Future<List<Product>> getHomePageProducts(int page) async {
    final result = await guardCall(
      call: () async {
        return await _client
            .from(tableName(Tables.products))
            .select()
            .neq('quantity', 0)
            .order('created_at')
            .range(fromRange(page), toRange(page));
      },
    );
    return result.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<List<Product>> queryByCategory(
    List<int> categoriesId,
    int? page,
  ) async {
    final result = await guardCall(
      call: () async {
        return await _client
            .from(tableName(Tables.products))
            .select()
            .neq('quantity', 0)
            .inFilter('category_id', categoriesId);
        //uncomment if you want to apply pagination
        // .range(fromRange(page), toRange(page));
      },
    );
    return result.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<List<Product>> queryByName(String query) async {
    final result = await guardCall(
      call: () async {
        return await _client
            .from(tableName(Tables.products))
            .select()
            .neq('quantity', 0)
            .ilike('name', '%$query%');
      },
    );
    return result.map((json) => ProductModel.fromJson(json)).toList();
  }
}
