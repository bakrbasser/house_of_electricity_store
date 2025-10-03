import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/cart_items_list.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/order_products.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/total_price.dart';

class CartItemsPage extends StatelessWidget {
  const CartItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: CartItemsReactiveList()),
          TotalPrice(),
          SizedBox(height: Spacing.tiny),
          OrderProducts(),
        ],
      ),
    );
  }
}
