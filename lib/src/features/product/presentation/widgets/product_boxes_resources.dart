import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';

class ProductImageHelper extends StatelessWidget {
  const ProductImageHelper({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    // in case no url was sent
    if (imageUrl == null || imageUrl!.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadiusGeometry.vertical(
          top: Radius.circular(RadiusV.v4),
        ),
        child: Image.asset(
          'assets/images/Image-not-found.png',
          fit: BoxFit.cover,
          semanticLabel: 'No product image available',
        ),
      );
    }
    //else if a url was sent
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.vertical(
          top: Radius.circular(RadiusV.v4),
        ),
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,

          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/Image-not-found.png',
              fit: BoxFit.cover,
              semanticLabel: 'No product image available',
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              height: screenHeightPercentage(context, 20),
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget({
    super.key,
    required this.productName,
    this.size = Sizes.s16,
  });
  final String productName;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: IBMMedium(fontSize: Sizes.s16),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$ $price",
      style: IBMMedium(fontSize: Sizes.s16, color: AppColors.darkGreen),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
