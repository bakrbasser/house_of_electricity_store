import 'package:get_it/get_it.dart';
import 'package:house_of_electricity/src/features/auth/data/repo/supabase_auth_repo.dart';
import 'package:house_of_electricity/src/features/auth/domain/repo/auth_repo.dart';
import 'package:house_of_electricity/src/features/cart_items/data/repositories/cart_items_repository.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/repositories/cart_items_repository.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/add_to_cart.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/clear_cart_use_case.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/fetch_cart_items_ids.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/get_cart_items.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/get_cart_items_ids.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/remove_from_cart.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/update_cart_quantity.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cart_items_cubit.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cubit/cart_items_operations_cubit.dart';
import 'package:house_of_electricity/src/features/category/data/repositories/supabase_categories_repository.dart';
import 'package:house_of_electricity/src/features/category/domain/repositories/categories_repository.dart';
import 'package:house_of_electricity/src/features/category/domain/use_cases/get_all_categories_usecase.dart';
import 'package:house_of_electricity/src/features/category/domain/use_cases/get_subcategories_usecase.dart';
import 'package:house_of_electricity/src/features/category/presentation/cubit/categories_list/categories_list_cubit.dart';
import 'package:house_of_electricity/src/features/favorites/data/repositories/supabase_favorites_repo.dart';
import 'package:house_of_electricity/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/add_to_favorites_use_case.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/fetch_favorite_product_ids_use_case.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/get_favorite_product_ids_use_case.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/get_favorites_use_case.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/remove_from_favorites_use_case.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/cubit/favorites_list/favorites_cubit.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/cubit/favorites_operations/favorites_operations_cubit.dart';
import 'package:house_of_electricity/src/features/initialization/domain/initi_use_case.dart';
import 'package:house_of_electricity/src/features/initialization/initializer.dart';
import 'package:house_of_electricity/src/features/initialization/presentation/cubit/initializer_cubit.dart';
import 'package:house_of_electricity/src/features/product/data/repositories/supabase/products_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/repositories/product_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/get_home_page_products_usecase.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/query_by_category_usecase.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/query_by_name_usecase.dart';
import 'package:house_of_electricity/src/features/product/presentation/cubit/products_list/products_list_cubit.dart';
import 'package:house_of_electricity/src/features/search/presentation/cubit/query_products_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final di = GetIt.instance;

final _supabase = Supabase.instance;

void initDi() {
  _initRepos();
  di.registerLazySingleton<Initializer>(
    () => Initializer(
      fetchFavoriteProductIdsUseCase: di.get<FetchFavoriteProductIdsUseCase>(),
      fetchCartItemsIds: di.get<FetchCartItemsIds>(),
      categoryRepository: di.get<CategoryRepository>(),
      authRepo: di.get<AuthRepo>(),
    ),
  );
  _initUseCases();
  _initCubits();
}

void _initRepos() {
  di.registerLazySingleton<ProductRepository>(
    () => SupabaseProductsRepository(client: _supabase.client),
  );
  di.registerLazySingleton<CategoryRepository>(
    () => SupabaseCategoriesRepository(client: _supabase.client),
  );
  di.registerLazySingleton<CartItemsRepository>(
    () => SupabaseCartItemsRepository(client: _supabase.client),
  );
  di.registerLazySingleton<AuthRepo>(
    () => SupabaseAuthRepo(authClient: _supabase.client.auth),
  );
  di.registerLazySingleton<FavoritesRepository>(
    () => SupabaseFavoritesRepo(supabaseClient: _supabase.client),
  );
}

void _initUseCases() {
  di.registerLazySingleton<InitUseCase>(
    () => InitUseCase(initializer: di.get<Initializer>()),
  );
  di.registerLazySingleton<QueryByNameUseCase>(
    () => QueryByNameUseCase(di.get<ProductRepository>()),
  );
  di.registerLazySingleton<QueryByCategoryUseCase>(
    () => QueryByCategoryUseCase(
      di.get<ProductRepository>(),
      di.get<CategoryRepository>(),
    ),
  );
  di.registerLazySingleton<GetHomePageProductsUseCase>(
    () => GetHomePageProductsUseCase(di.get<ProductRepository>()),
  );
  // Categories
  di.registerLazySingleton<GetAllCategoriesUseCase>(
    () => GetAllCategoriesUseCase(di.get<CategoryRepository>()),
  );
  di.registerLazySingleton<GetSubcategoriesUseCase>(
    () => GetSubcategoriesUseCase(di.get<CategoryRepository>()),
  );
  // Cart
  di.registerLazySingleton<ClearCartUseCase>(
    () => ClearCartUseCase(di.get<CartItemsRepository>()),
  );
  di.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(di.get<CartItemsRepository>()),
  );
  di.registerLazySingleton<GetCartItemsUseCase>(
    () => GetCartItemsUseCase(di.get<CartItemsRepository>()),
  );
  di.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(di.get<CartItemsRepository>()),
  );
  di.registerLazySingleton<UpdateCartQuantityUseCase>(
    () => UpdateCartQuantityUseCase(di.get<CartItemsRepository>()),
  );
  di.registerLazySingleton<GetCartItemsIdsUseCase>(
    () => GetCartItemsIdsUseCase(di.get<CartItemsRepository>()),
  );
  di.registerLazySingleton<FetchCartItemsIds>(
    () => FetchCartItemsIds(di.get<CartItemsRepository>()),
  );
  // Favorites
  di.registerLazySingleton<AddToFavoritesUseCase>(
    () => AddToFavoritesUseCase(di.get<FavoritesRepository>()),
  );
  di.registerLazySingleton<RemoveFromFavoritesUseCase>(
    () => RemoveFromFavoritesUseCase(di.get<FavoritesRepository>()),
  );
  di.registerLazySingleton<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(di.get<FavoritesRepository>()),
  );
  di.registerLazySingleton<FetchFavoriteProductIdsUseCase>(
    () => FetchFavoriteProductIdsUseCase(di.get<FavoritesRepository>()),
  );
  di.registerLazySingleton<GetFavoriteProductIdsUseCase>(
    () => GetFavoriteProductIdsUseCase(di.get<FavoritesRepository>()),
  );
}

void _initCubits() {
  di.registerFactory<InitializerCubit>(
    () => InitializerCubit(di.get<InitUseCase>()),
  );
  di.registerFactory<HomeProductsListCubit>(
    () => HomeProductsListCubit(di.get<GetHomePageProductsUseCase>()),
  );

  //Categories
  di.registerFactory<CategoriesListCubit>(
    () => CategoriesListCubit(
      di.get<GetAllCategoriesUseCase>(),
      di.get<GetSubcategoriesUseCase>(),
    ),
  );
  //Cart
  di.registerFactory<CartItemsCubit>(
    () => CartItemsCubit(
      removeFromCartUseCase: di.get<RemoveFromCartUseCase>(),
      clearCart: di.get<ClearCartUseCase>(),
      getCartItems: di.get<GetCartItemsUseCase>(),
      updateQuantity: di.get<UpdateCartQuantityUseCase>(),
    ),
  );
  di.registerFactory<CartItemsOperationsCubit>(
    () => CartItemsOperationsCubit(
      addToCart: di.get<AddToCartUseCase>(),
      getCartItemsIdsUseCase: di.get<GetCartItemsIdsUseCase>(),

      removeFromCart: di.get<RemoveFromCartUseCase>(),
    ),
  );
  //Querying
  di.registerFactory<QueryProductsCubit>(
    () => QueryProductsCubit(
      di.get<QueryByNameUseCase>(),
      di.get<QueryByCategoryUseCase>(),
    ),
  );
  //Favorites
  di.registerFactory<FavoritesOperationsCubit>(
    () => FavoritesOperationsCubit(
      di.get<RemoveFromFavoritesUseCase>(),
      di.get<AddToFavoritesUseCase>(),
      di.get<GetFavoriteProductIdsUseCase>(),
    ),
  );
  di.registerFactory<FavoritesListCubit>(
    () => FavoritesListCubit(di.get<GetFavoritesUseCase>()),
  );
}
