import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/app/product_messager.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class ShareProduct extends StatelessWidget {
  const ShareProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.ios_share));
  }
}
