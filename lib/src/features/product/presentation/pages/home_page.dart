import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/category/presentation/widgets/categories_lists.dart';
import 'package:house_of_electricity/src/features/product/presentation/widgets/products_list.dart';
import 'package:house_of_electricity/src/features/search/presentation/widgets/search_product_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchProductField(searchFieldType: SearchFieldType.home),
          SizedBox(height: Spacing.medium),
          Text('الفئات', style: IBMMedium(fontSize: Sizes.s24)),
          SizedBox(height: Spacing.medium),
          SizedBox(
            height: screenHeightPercentage(context, 15),
            child: ReactiveCategoriesHorizontalLists(),
          ),
          Text(
            'أحدث المنتجات',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.s28),
          ),
          //GridView
          LatestProductsList(controller: controller),
        ],
      ),
    );
  }
}
