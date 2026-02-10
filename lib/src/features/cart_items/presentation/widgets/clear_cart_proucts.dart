import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cart_items_cubit.dart';

class ClearCartProucts extends StatelessWidget {
  const ClearCartProucts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<CartItemsCubit>().clearCartItems();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red[500]),
        child: Text('تصفية سلة المشتريات', style: IBMBold(color: Colors.white)),
      ),
    );
  }
}
