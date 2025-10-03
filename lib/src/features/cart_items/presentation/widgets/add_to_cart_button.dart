import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';

import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cubit/cart_items_operations_cubit.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key, required this.product});
  final Product product;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool isBought = false;
  final notBought = Icon(
    Icons.add_shopping_cart_outlined,
    size: Sizes.s28,
    color: AppColors.darkerGrey,
  );
  Widget bought = Icon(
    Icons.shopping_cart,
    size: Sizes.s28,
    color: AppColors.mainGreen,
  );
  late Widget child;

  @override
  void initState() {
    super.initState();
    if (context.read<CartItemsOperationsCubit>().isCartItem(
      widget.product.id,
    )) {
      isBought = true;
      child = bought;
    } else {
      isBought = false;
      child = notBought;
    }
  }

  void buyProduct() async {
    if (isBought) {
      await context.read<CartItemsOperationsCubit>().removeItem(
        widget.product.id,
      );
      setState(() {
        child = notBought;
        isBought = false;
      });
    } else {
      await context.read<CartItemsOperationsCubit>().addItem(widget.product);
      setState(() {
        child = bought;
        isBought = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: buyProduct, icon: child);
  }
}
