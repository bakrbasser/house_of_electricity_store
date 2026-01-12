import 'package:house_of_electricity/src/core/consts/database_consts.dart';
import 'package:house_of_electricity/src/core/error_handler/error_handler.dart';
import 'package:house_of_electricity/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:house_of_electricity/src/features/product/data/models/product_model.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFavoritesRepo implements FavoritesRepository {
  final SupabaseClient _supabaseClient;

  String get _userUuid => _supabaseClient.auth.currentUser!.id;

  Set<int> _ids = {};

  SupabaseFavoritesRepo({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  @override
  Future<void> addToFavorites(Product product) async {
    await guardCall(
      call: () async {
        await _supabaseClient.from('Favorites').insert({
          'product_id': product.id,
          'user_uuid': _userUuid,
        });
      },
    );
    _ids.add(product.id);
  }

  @override
  Future<void> fetchFavoriteProductIds() async {
    await guardCall(
      call: () async {
        final result = await _supabaseClient
            .from('Favorites')
            .select('product_id')
            .eq('user_uuid', _userUuid);
        _ids = Set.from(
          result.map<int>((e) => e['product_id'] as int).toList(),
        );
      },
    );
  }

  @override
  Set<int> getFavoriteProductIds() {
    return _ids;
  }

  @override
  Future<List<Product>> getFavorites() async {
    final products = await guardCall(
      call: () async {
        return await _supabaseClient
            .from(tableName(Tables.favorites))
            .select('''
Products(*)''')
            .eq('user_uuid', _userUuid);
      },
    );
    return products
        .map<Product>((e) => ProductModel.fromJson(e['Products']))
        .toList();
  }

  //FIX THIS SHIT BEFORE I GO CRAZY
  @override
  Future<void> removeFromFavorites(int productId) async {
    await guardCall(
      call: () async {
        await _supabaseClient
            .from('Favorites')
            .delete()
            .eq('product_id', productId)
            .eq('user_uuid', _userUuid);
      },
    );
    _ids.remove(productId);
  }
}
