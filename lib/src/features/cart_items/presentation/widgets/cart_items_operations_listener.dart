import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/dialogs.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cubit/cart_items_operations_cubit.dart';

class CartItemsOperationsListener extends StatelessWidget {
  const CartItemsOperationsListener({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartItemsOperationsCubit, CartItemsOperationsState>(
      listener: (context, state) {
        if (state is CartItemsOperationsFailed) {
          showAlertDialog(context, state.message);
        }
      },
    );
  }
}
