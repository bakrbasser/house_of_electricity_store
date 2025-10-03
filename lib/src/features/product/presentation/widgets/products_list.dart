import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/dialogs.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/presentation/cubit/products_list/products_list_cubit.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/product_box.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.products,
    this.controller,
    this.scrollPhysics,
  });

  final List<Product> products;

  final ScrollController? controller;

  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: scrollPhysics,
      controller: controller,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: Spacing.medium,
      ),
      itemBuilder: (context, index) => ProductBox(product: products[index]),
    );
  }
}

class _PaginatedProductsList extends StatefulWidget {
  const _PaginatedProductsList({required this.controller});

  final ScrollController controller;
  @override
  State<_PaginatedProductsList> createState() => _PaginatedProductsListState();
}

class _PaginatedProductsListState extends State<_PaginatedProductsList> {
  final List<Product> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.position.pixels >=
          widget.controller.position.maxScrollExtent) {
        context.read<HomeProductsListCubit>().loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeProductsListCubit, HomeProductsListState>(
      listener: (context, state) {
        if (isLoading == true) {
          isLoading = false;
          Navigator.of(context, rootNavigator: true).pop();
        }
        if (state is ProductsListFailed) {
          showAboutDialog(context: context, children: [Text(state.message)]);
        }

        if (state is ProductsListFull) {
          setState(() {
            products.addAll(state.products);
          });
        } else if (state is ProductsListLoading) {
          showLoadingDialog(context);
          isLoading = true;
        }
      },
      child: ProductsList(
        products: products,
        scrollPhysics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class LatestProductsList extends StatefulWidget {
  const LatestProductsList({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<LatestProductsList> createState() => LatestProductsListState();
}

class LatestProductsListState extends State<LatestProductsList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProductsListCubit>().getHomePageProducts();
  }

  @override
  Widget build(BuildContext context) {
    return _PaginatedProductsList(controller: widget.controller);
  }
}
