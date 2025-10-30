import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/app/product_messager.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:share_plus/share_plus.dart';

class ShareProduct extends StatelessWidget {
  const ShareProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Share.share(productShareMessage(product));
      },
      icon: Icon(Icons.ios_share),
    );
  }
}
