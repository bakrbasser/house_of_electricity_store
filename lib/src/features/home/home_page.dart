import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/app/routing_helper.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
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

// Old Implementation
// class _HomePageState extends State<HomePage> {
//   final ScrollController controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SearchProductField(searchFieldType: SearchFieldType.home),
//         Expanded(
//           child: SingleChildScrollView(
//             controller: controller,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('الفئات', style: IBMMedium(fontSize: Sizes.s24)),
//                 SizedBox(height: Spacing.medium),
//                 SizedBox(
//                   height: screenHeightPercentage(context, 15),
//                   child: ReactiveCategoriesHorizontalLists(),
//                 ),
//                 Text(
//                   'أحدث المنتجات',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: Sizes.s28,
//                   ),
//                 ),
//                 //GridView
//                 LatestProductsList(controller: controller),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          // expandedHeight: 80,
          title: const MainAppBarTitle(),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: SearchProductField(searchFieldType: SearchFieldType.home),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: Spacing.medium)),
        SliverToBoxAdapter(
          child: Text('الفئات', style: IBMMedium(fontSize: Sizes.s24)),
        ),

        SliverToBoxAdapter(child: SizedBox(height: Spacing.medium)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeightPercentage(context, 15),
            child: ReactiveCategoriesHorizontalLists(),
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'أحدث المنتجات',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.s28),
          ),
        ),
        SliverToBoxAdapter(child: LatestProductsList(controller: controller)),
      ],
    );
  }
}

// Old Implementation
class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(padding: const EdgeInsets.all(8.0), child: child),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
    );
  }
}

class MainAppBarTitle extends StatefulWidget {
  const MainAppBarTitle({super.key});

  @override
  State<MainAppBarTitle> createState() => _MainAppBarTitleState();
}

class _MainAppBarTitleState extends State<MainAppBarTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // full rotation every 5 seconds
    )..repeat(); // keep rotating forever
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // rotate from 0 → 2π radians continuously
            final rotation = _controller.value * 2 * pi;
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(rotation),
              child: child,
            );
          },
          child: const Icon(Icons.house_outlined, size: 32),
        ),
        const SizedBox(width: 8),
        const Text('بيت الكهرباء'),
      ],
    );
  }
}

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = getIndex(location);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.mainGreen,
      unselectedItemColor: AppColors.darkerGrey,
      onTap: (index) {
        final path = getPath(index);
        context.go(path);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.house_outlined),
          activeIcon: Icon(Icons.house),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          activeIcon: Icon(Icons.category),
          label: 'الفئات',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: 'المشتريات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          activeIcon: Icon(Icons.favorite),
          label: 'المفضلة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          activeIcon: Icon(Icons.info),
          label: 'من نحن',
        ),
      ],
    );
  }
}
