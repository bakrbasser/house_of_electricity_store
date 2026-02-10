import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/features/category/presentation/widgets/categories_lists.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الفئات')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CategoriesVerticalLists(),
        ),
      ),
    );
  }
}
