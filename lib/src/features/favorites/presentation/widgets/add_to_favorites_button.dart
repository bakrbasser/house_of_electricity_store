import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/cubit/favorites_operations/favorites_operations_cubit.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

class AddToFavoritesButton extends StatefulWidget {
  const AddToFavoritesButton({super.key, required this.product});

  final Product product;

  @override
  State<AddToFavoritesButton> createState() => _AddToFavoritesButtonState();
}

class _AddToFavoritesButtonState extends State<AddToFavoritesButton> {
  bool isFavorite = false;

  final unFavoriteIcon = Icon(
    Icons.favorite_border,
    color: AppColors.darkerGrey,
    size: Sizes.s28,
  );

  final favoriteIcon = Icon(Icons.favorite, color: Colors.red, size: Sizes.s28);

  late Widget child;

  void onPressed() {
    setState(() {
      if (isFavorite) {
        context.read<FavoritesOperationsCubit>().removeFromFavorites(
          widget.product.id,
        );
        isFavorite = false;
        child = unFavoriteIcon;
      } else {
        context.read<FavoritesOperationsCubit>().addToFavorites(widget.product);
        isFavorite = true;
        child = favoriteIcon;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isFavorite = context.read<FavoritesOperationsCubit>().isInFavorites(
      widget.product.id,
    );
    child = isFavorite ? favoriteIcon : unFavoriteIcon;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: child);
  }
}
