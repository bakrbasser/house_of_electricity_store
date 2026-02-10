import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/presentation/cubit/categories_list/categories_list_cubit.dart';
import 'package:house_of_electricity/src/features/category/presentation/widgets/category_box.dart';
import 'package:house_of_electricity/src/features/category/presentation/widgets/category_tile.dart';

class CategoriesHorizontalLists extends StatelessWidget {
  const CategoriesHorizontalLists({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,

      scrollDirection: Axis.horizontal,

      itemCount: categories.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: Spacing.small),
        child: CategoryCircularBox(category: categories[index]),
      ),
    );
  }
}

class ReactiveCategoriesHorizontalLists extends StatefulWidget {
  const ReactiveCategoriesHorizontalLists({super.key});

  @override
  State<ReactiveCategoriesHorizontalLists> createState() =>
      _ReactiveCategoriesHorizontalListsState();
}

class _ReactiveCategoriesHorizontalListsState
    extends State<ReactiveCategoriesHorizontalLists> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesListCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListCubit, CategoriesListState>(
      builder: (context, state) {
        if (state is CategoriesListLoaded) {
          return CategoriesHorizontalLists(categories: state.mainCategories);
        }
        return CircularProgressIndicator(color: AppColors.mainYellow);
      },
    );
  }
}

class CategoriesVerticalLists extends StatefulWidget {
  const CategoriesVerticalLists({super.key});

  @override
  State<CategoriesVerticalLists> createState() =>
      _CategoriesVerticalListsState();
}

class _CategoriesVerticalListsState extends State<CategoriesVerticalLists> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesListCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListCubit, CategoriesListState>(
      builder: (context, state) {
        if (state is CategoriesListLoaded) {
          return ListView.builder(
            itemCount: state.mainCategories.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsetsGeometry.only(bottom: Spacing.medium),
              child: CategoryRectangularBox(
                category: state.mainCategories[index],
                subCategories: state.subCategory(index),
              ),
            ),
          );
        }
        return CircularProgressIndicator(color: AppColors.mainYellow);
      },
    );
  }
}
