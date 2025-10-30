import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/app/routing_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: mainAppBarTitle()),
        body: Padding(padding: const EdgeInsets.all(8.0), child: child),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
    );
  }
}

Widget mainAppBarTitle() {
  return const Row(
    children: [
      Icon(Icons.house_outlined, size: Sizes.s32),
      SizedBox(width: Spacing.small),
      Text('بيت الكهرباء'),
    ],
  );
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
      ],
    );
  }
}
