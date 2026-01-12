import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/add_to_cart_button.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/widgets/add_to_favorites_button.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/product_boxes_resources.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/details/${product.id}', extra: product);
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageHelper(imageUrl: product.imageUrl),
              SizedBox(height: Spacing.small),
              ProductNameWidget(productName: product.name),
              SizedBox(height: Spacing.tiny),
              ProductPriceWidget(price: product.price),
              Spacer(),
              Row(
                children: [
                  AddToFavoritesButton(product: product),
                  Spacer(),
                  AddToCartButton(product: product),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
