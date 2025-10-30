import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/add_to_cart_button.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/widgets/add_to_favorites_button.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/product_boxes_resources.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/share_product.dart';

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

    //in case the product details were open from a browser link and not from the app

    if (widget.product == null) {
      //TODO : do something
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(actions: [ShareProduct(product: widget.product!)]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: Spacing.small,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageHelper(imageUrl: widget.product?.imageUrl),
              SizedBox(height: Spacing.small),
              Text(widget.product!.name, style: IBMMedium(fontSize: Sizes.s20)),
              SizedBox(height: Spacing.small),
              Text('الوصف', style: IBMBold(fontSize: Sizes.s24)),
              Text(widget.product!.description, style: IBMMedium()),
              SizedBox(height: Spacing.small),
              Text('السعر', style: IBMBold(fontSize: Sizes.s24)),
              Text('${widget.product!.price} دولار', style: IBMMedium()),
              Spacer(),
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
    );
  }
}
