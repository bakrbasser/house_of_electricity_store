import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';

class OrderProducts extends StatelessWidget {
  const OrderProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.mainGreen),
        child: Text('طلب المنتجات', style: IBMBold(color: Colors.white)),
      ),
    );
  }
}
