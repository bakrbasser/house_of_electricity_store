import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/add_to_cart_button.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/widgets/add_to_favorites_button.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/presentation/cubit/products_list/products_list_cubit.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/product_boxes_resources.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/products_list.dart';
import 'package:house_of_electricity/src/features/search/presentation/cubit/query_products_cubit.dart';
import 'package:house_of_electricity/src/features/search/presentation/pages/searched_products_page.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productID, this.product});

  final Product? product;
  final int productID;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    context.read<QueryProductsCubit>().queryByCategory(
      widget.product!.categoryId,
      null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // this listener deletes the opened product from the related products list
          child: BlocListener<QueryProductsCubit, ProductsListState>(
            listener: (context, state) {
              if (state is ProductsListFull) {
                state.products.removeWhere(
                  (element) => element.id == widget.productID,
                );
              }
            },
            child: SingleChildScrollView(
              child: Column(
                spacing: Spacing.small,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageHelper(imageUrl: widget.product?.imageUrl),
                  SizedBox(height: Spacing.small),
                  Text(
                    '\$ ${widget.product!.price}',
                    style: IBMBold(
                      color: AppColors.mainGreen,
                      fontSize: Sizes.s24,
                    ),
                  ),
                  Text(
                    widget.product!.name,
                    style: IBMBold(
                      fontSize: Sizes.s24,
                      color: AppColors.mainGreen,
                    ),
                  ),
                  SizedBox(height: Spacing.small),
                  Text('الوصف', style: IBMBold(fontSize: Sizes.s24)),
                  Text(
                    widget.product!.description,
                    style: IBMMedium(fontSize: Sizes.s20),
                  ),
                  SizedBox(height: Spacing.small),
                  SizedBox(height: Spacing.small),
                  Text('منتجات مماثلة', style: IBMBold(fontSize: Sizes.s24)),
                  SizedBox(
                    height: screenHeightPercentage(context, 35),
                    child: QueryingProductsListener(
                      child: QueryingProductsListBuilder(
                        productsListType: ProductsListType.singleHorizontal,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddToFavoritesButton(product: widget.product!),
                      Text(
                        'منتجات بيت الكهرباء',
                        style: IBMMedium(color: AppColors.darkGreen),
                      ),
                      AddToCartButton(product: widget.product!),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
