import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/app/di.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cart_items_cubit.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/pages/cart_items_page.dart';
import 'package:house_of_electricity/src/features/category/presentation/cubit/categories_list/categories_list_cubit.dart';
import 'package:house_of_electricity/src/features/category/presentation/pages/categories_page.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/cubit/favorites_list/favorites_cubit.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/pages/favorite_items_page.dart';
import 'package:house_of_electricity/src/features/initialization/presentation/cubit/initializer_cubit.dart';
import 'package:house_of_electricity/src/features/initialization/presentation/initial_screen.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/presentation/cubit/products_list/products_list_cubit.dart';
import 'package:house_of_electricity/src/features/home/home_page.dart';
import 'package:house_of_electricity/src/features/product/presentation/pages/product_details.dart';
import 'package:house_of_electricity/src/features/search/presentation/cubit/query_products_cubit.dart';
import 'package:house_of_electricity/src/features/search/presentation/pages/searched_products_page.dart';

enum Pages {
  home('/home'),
  categories('/categories'),
  favorites('/favorites'),
  cart('/cart');

  const Pages(this.path);
  final String path;
}

final router = GoRouter(
  // initialLocation: Pages.home.path,
  routes: [
    GoRoute(
      path: '/',
      name: 'initializer',
      builder: (context, state) => BlocProvider(
        create: (context) => di.get<InitializerCubit>(),
        child: InitialScreen(),
      ),
    ),
    ShellRoute(
      routes: [
        GoRoute(
          path: Pages.home.path,
          name: Pages.home.name,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeProductsListCubit>(
                create: (context) => di.get<HomeProductsListCubit>(),
              ),
              BlocProvider(create: (context) => di.get<CategoriesListCubit>()),
            ],
            child: HomePage(),
          ),
          routes: [
            GoRoute(
              path: 'search/:query',
              builder: (context, state) {
                String query = state.pathParameters['query']!;
                return BlocProvider(
                  create: (context) => di.get<QueryProductsCubit>(),
                  child: QueryProductList(query: query),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Pages.categories.path,
          name: Pages.categories.name,
          builder: (context, state) => BlocProvider(
            create: (context) => di.get<CategoriesListCubit>(),
            child: CategoriesPage(),
          ),
          routes: [
            GoRoute(
              path: 'search/:category_id',
              builder: (context, state) {
                int categoryId = int.parse(
                  state.pathParameters['category_id']!,
                );
                return BlocProvider(
                  create: (context) => di.get<QueryProductsCubit>(),
                  child: CategoryProductList(categoryId: categoryId),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Pages.cart.path,
          name: Pages.cart.name,
          builder: (context, state) => BlocProvider(
            create: (context) => di.get<CartItemsCubit>(),
            child: CartItemsPage(),
          ),
        ),
        GoRoute(
          path: Pages.favorites.path,
          name: Pages.favorites.name,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => di.get<FavoritesListCubit>(),
              child: FavoriteItemsPage(),
            );
          },
        ),
      ],
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) {
        int productID = int.parse(state.pathParameters['id']!);
        Product? product = state.extra as Product?;
        return BlocProvider(
          create: (context) => di.get<QueryProductsCubit>(),
          child: ProductDetails(productID: productID, product: product),
        );
      },
    ),
  ],
);
