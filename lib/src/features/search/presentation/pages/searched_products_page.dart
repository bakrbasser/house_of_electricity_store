import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/dialogs.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/product/presentation/cubit/products_list/products_list_cubit.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/products_list.dart';
import 'package:house_of_electricity/src/features/search/presentation/cubit/query_products_cubit.dart';
import 'package:house_of_electricity/src/features/search/presentation/widgets/search_product_field.dart';
import 'package:house_of_electricity/src/features/search/presentation/widgets/sort_products_dialog.dart';

class QueryProductList extends StatelessWidget {
  const QueryProductList({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return SearchedProductsPage(
      queryingFunction: () {
        context.read<QueryProductsCubit>().queryByName();
      },
    );
  }
}

class CategoryProductList extends StatelessWidget {
  const CategoryProductList({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return SearchedProductsPage(
      queryingFunction: () {
        context.read<QueryProductsCubit>().queryByCategory(categoryId, null);
      },
    );
  }
}

class SearchedProductsPage extends StatefulWidget {
  const SearchedProductsPage({super.key, required this.queryingFunction});

  final void Function() queryingFunction;

  @override
  State<SearchedProductsPage> createState() => _SearchedProductsPageState();
}

class _SearchedProductsPageState extends State<SearchedProductsPage> {
  @override
  void initState() {
    super.initState();
    widget.queryingFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('نتائج البحث')),
      body: Column(
        children: [
          SortSearchRow(widget: widget),
          SizedBox(height: Spacing.small),
          QueryingProductsListener(child: QueryingProductsListBuilder()),
        ],
      ),
    );
  }
}

class QueryingProductsListener extends StatelessWidget {
  const QueryingProductsListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<QueryProductsCubit, ProductsListState>(
      listener: (context, state) {
        if (state is ProductsListFailed) {
          showAlertDialog(
            context,
            state.message,
            okMessage: 'اعادة المحاولة',
            onOk: () {
              context.read<QueryProductsCubit>().queryByName();
            },
          );
        }
      },
      child: child,
    );
  }
}

class SortSearchRow extends StatelessWidget {
  const SortSearchRow({super.key, required this.widget});

  final SearchedProductsPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchProductField(searchFieldType: SearchFieldType.regular),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: IconButton(
            onPressed: () {
              showSortProductsDialog(
                context,
                context.read<QueryProductsCubit>(),
              );
            },
            icon: Icon(Icons.sort_sharp, color: AppColors.darkerGrey),
          ),
        ),
      ],
    );
  }
}

class QueryingProductsListBuilder extends StatelessWidget {
  const QueryingProductsListBuilder({super.key, this.productsListType});
  final ProductsListType? productsListType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueryProductsCubit, ProductsListState>(
      builder: (context, state) {
        if (state is ProductsLisEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                'لا يوجد منتجات تطابق جملة البحث المدخل يرجى اعادة المحاولة باستخدام جملة بحث اخرى',
                style: IBMRegular(),
              ),
            ),
          );
        } else if (state is ProductsListLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductsListFull) {
          return Expanded(
            child: ProductsList(
              products: state.products,
              productsListType: productsListType,
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
