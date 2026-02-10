import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/dialogs.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cart_items_cubit.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/cart_items_list.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/clear_cart_proucts.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/order_products.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/total_price.dart';

class CartItemsPage extends StatelessWidget {
  const CartItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartItemsCubit, CartItemsState>(
      listener: (context, state) {
        if (state is CartItemsFailed) {
          showAlertDialog(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('عربة التسوق')),
        body: Column(
          children: [
            Expanded(child: CartItemsReactiveList()),
            TotalPrice(),
            SizedBox(height: Spacing.tiny),
            OrderProducts(),
            ClearCartProucts(),
          ],
        ),
      ),
    );
  }
}
