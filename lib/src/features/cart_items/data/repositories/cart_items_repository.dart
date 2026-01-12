import 'package:house_of_electricity/src/core/consts/database_consts.dart';
import 'package:house_of_electricity/src/core/error_handler/error_handler.dart';
import 'package:house_of_electricity/src/features/cart_items/data/models/cart_product_model.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/entities/cart_product.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCartItemsRepository implements CartItemsRepository {
  final SupabaseClient _client;

  SupabaseCartItemsRepository({required SupabaseClient client})
    : _client = client;

  Set<int> _ids = {};

  @override
  Future<void> addToCart(Product product) async {
    CartProductModel model = CartProductModel.fromProduct(product);

    guardCall(
      call: () async {
        await _client
            .from(tableName(Tables.cartItems))
            .insert(model.toSupabase());
        _ids.add(product.id);
      },
    );
  }

  @override
  Future<List<CartProduct>> getCartItems() async {
    String userUuid = _client.auth.currentUser!.id;

    final result = await guardCall(
      call: () async {
        return _client
            .from(tableName(Tables.cartItems))
            .select('''
Products(*),
quantity,
id
''')
            .eq('user_uuid', userUuid);
      },
    );

    return result.map((json) => CartProductModel.fromJson(json)).toList();
  }

  @override
  Future<void> removeFromCart(int productId) async {
    String userUuid = _client.auth.currentUser!.id;

    await guardCall(
      call: () async {
        return _client
            .from(tableName(Tables.cartItems))
            .delete()
            .eq('product_id', productId)
            .eq('user_uuid', userUuid);
      },
    );
    _ids.remove(productId);
  }

  @override
  Future<void> updateQuantity(int productId, int quantity) async {
    String userUuid = _client.auth.currentUser!.id;

    await guardCall(
      call: () async {
        await _client
            .from(tableName(Tables.cartItems))
            .update({'quantity': quantity})
            .eq('product_id', productId)
            .eq('user_uuid', userUuid);
      },
    );
    return;
  }

  @override
  Future<void> clearCart() async {
    String userUuid = _client.auth.currentUser!.id;

    guardCall(
      call: () async {
        return await _client
            .from(tableName(Tables.cartItems))
            .delete()
            .eq('user_uuid', userUuid);
      },
    );
    _ids.clear();
  }

  @override
  Future<void> fetchCartItemsIds() async {
    String userUuid = _client.auth.currentUser!.id;

    final ids = await guardCall(
      call: () async {
        return await _client
            .from(tableName(Tables.cartItems))
            .select('product_id')
            .eq('user_uuid', userUuid);
      },
    );
    _ids = Set<int>.from(
      List.generate(ids.length, (index) => ids[index]['product_id']),
    );
  }

  @override
  Set<int> getCartItemsIds() => _ids;
}
