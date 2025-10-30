import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/entities/cart_product.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cart_items_cubit.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/product_boxes_resources.dart';

class CartItemBoxLayout extends StatelessWidget {
  const CartItemBoxLayout({super.key, required this.cartProduct});

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    final double boxHeight = screenHeightPercentage(context, 15);

    return InkWell(
      onTap: () {
        // Navigate to product details page
        context.push(
          '/details/${cartProduct.product.id}',
          extra: cartProduct.product,
        );
      },
      child: Card(
        child: SizedBox(
          height: boxHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ProductImageHelper(imageUrl: cartProduct.product.imageUrl),
                const SizedBox(width: Spacing.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductNameWidget(productName: cartProduct.product.name),
                      ProductPriceWidget(price: cartProduct.product.price),
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          QuantityController(cartProduct: cartProduct),
                        ],
                      ),
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

class QuantityController extends StatefulWidget {
  final CartProduct cartProduct;

  const QuantityController({super.key, required this.cartProduct});

  @override
  State<QuantityController> createState() => _QuantityControllerState();
}

class _QuantityControllerState extends State<QuantityController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          //   backgroundColor: AppColors.mainYellow,
          child: const Icon(Icons.add),
          onTap: () {
            setState(() {
              widget.cartProduct.quantity++;
            });
            context.read<CartItemsCubit>().addToItemQuantity(
              widget.cartProduct,
              widget.cartProduct.quantity,
            );
          },
        ),

        CustomButton(
          onTap: null,
          backgroundColor: AppColors.mainGreen,

          child: Text(
            widget.cartProduct.quantity.toString(),
            style: IBMMedium(fontSize: 16, color: Colors.white),
          ),
        ),
        CustomButton(
          //   backgroundColor: AppColors.mainYellow,
          child: const Icon(Icons.remove),
          onTap: () {
            setState(() {
              if (widget.cartProduct.quantity > 0) {
                widget.cartProduct.quantity--;
                context.read<CartItemsCubit>().decreaseItemQuantity(
                  widget.cartProduct,
                  widget.cartProduct.quantity,
                );
              }
            });
          },
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor = Colors.white,
    required this.child,
    required this.onTap,
  });

  final Color? backgroundColor;
  final Widget child;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(onTap: onTap, child: child),
    );
  }
}
