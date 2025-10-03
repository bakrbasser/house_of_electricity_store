import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/add_to_cart_button.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/widgets/add_to_favorites_button.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
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
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.vertical(
                    top: Radius.circular(RadiusV.v4),
                  ),
                  child: Image.asset(
                    'assets/images/71xaR3qz7TL.jpg',
                    // height: screenWidthPercentage(context, 40),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: Spacing.small),

                Text(
                  product.name,
                  style: IBMMedium(fontSize: Sizes.s16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: Spacing.tiny),
                Text(
                  "\$ ${product.price}",
                  style: IBMMedium(
                    fontSize: Sizes.s16,
                    color: AppColors.darkGreen,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
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
      ),
    );
  }
}
