import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/cubit/favorites_operations/favorites_operations_cubit.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/product_boxes_resources.dart';

class FavoriteItemBoxLayout extends StatelessWidget {
  const FavoriteItemBoxLayout({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final double boxHeight = screenHeightPercentage(context, 15);

    return InkWell(
      onTap: () {
        // Navigate to product details page
        context.push('/details/${product.id}', extra: product);
      },
      child: Card(
        child: SizedBox(
          height: boxHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: boxHeight - 16, // subtract padding
                  width: screenWidthPercentage(context, 25),
                  child: ProductImageHelper(imageUrl: product.imageUrl),
                ),
                const SizedBox(width: Spacing.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductNameWidget(productName: product.name),
                      ProductPriceWidget(price: product.price),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteProductBoxList extends StatelessWidget {
  final List<Product> products;

  const FavoriteProductBoxList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          context.read<FavoritesOperationsCubit>().removeFromFavorites(
            products[index].id,
          );
        },
        key: Key(products[index].name),
        child: FavoriteItemBoxLayout(product: products[index]),
      ),
    );
  }
}
