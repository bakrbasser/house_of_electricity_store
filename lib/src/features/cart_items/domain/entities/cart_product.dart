import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class CartProduct {
  final int id;
  final Product product;
  int quantity;

  CartProduct({
    required this.id,
    required this.product,
    required this.quantity,
  });

  double get totalPrice => quantity * product.price;
}
