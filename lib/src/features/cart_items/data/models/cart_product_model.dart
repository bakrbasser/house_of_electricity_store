import 'package:house_of_electricity/src/features/cart_items/domain/entities/cart_product.dart';
import 'package:house_of_electricity/src/features/product/data/models/product_model.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class CartProductModel extends CartProduct {
  CartProductModel({
    required super.id,
    required super.product,
    required super.quantity,
  });

  Map<String, dynamic> toSupabase() {
    return {'product_id': product.id, 'quantity': quantity};
  }

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      product: ProductModel.fromJson(json['Products']),
      quantity: json['quantity'],
    );
  }

  factory CartProductModel.fromEntity(CartProduct product) {
    return CartProductModel(
      id: product.id,
      product: product.product,
      quantity: product.quantity,
    );
  }
  factory CartProductModel.fromProduct(Product product) {
    return CartProductModel(id: product.id, product: product, quantity: 1);
  }
}
