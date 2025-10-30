import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/cubit/favorites_list/favorites_cubit.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/widgets/favorite_product_box.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';

class FavoriteItemsPage extends StatefulWidget {
  const FavoriteItemsPage({super.key});

  @override
  State<FavoriteItemsPage> createState() => _FavoriteItemsPageState();
}

class _FavoriteItemsPageState extends State<FavoriteItemsPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesListCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoritesListCubit, FavoritesListState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesFull) {
            final products = state.favorites;
            if (products.isEmpty) {
              return Center(
                child: Text(
                  'لا يوجد عناصر مضافة الى المفضلة',
                  style: IBMBold(),
                ),
              );
            }
            return FavoriteProductBoxList(products: products);
          } else if (state is FavoritesFailed) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
