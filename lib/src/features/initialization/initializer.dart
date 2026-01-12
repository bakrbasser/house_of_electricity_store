import 'package:house_of_electricity/src/features/auth/domain/repo/auth_repo.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/use_cases/fetch_cart_items_ids.dart';
import 'package:house_of_electricity/src/features/category/domain/repositories/categories_repository.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/fetch_favorite_product_ids_use_case.dart';

class Initializer {
  final CategoryRepository _categoryRepository;
  final AuthRepo _authRepo;
  final FetchCartItemsIds _fetchCartItemsIds;
  final FetchFavoriteProductIdsUseCase _fetchFavoriteProductIdsUseCase;

  Initializer({
    required CategoryRepository categoryRepository,
    required AuthRepo authRepo,
    required FetchCartItemsIds fetchCartItemsIds,
    required FetchFavoriteProductIdsUseCase fetchFavoriteProductIdsUseCase,
  }) : _categoryRepository = categoryRepository,
       _authRepo = authRepo,
       _fetchCartItemsIds = fetchCartItemsIds,
       _fetchFavoriteProductIdsUseCase = fetchFavoriteProductIdsUseCase;

  Future<void> init() async {
    // Auth
    if (!await _authRepo.isLoggedIn()) {
      await _authRepo.logInAnonymously();
    }
    // Categories
    await _categoryRepository.fetchAllCategories();
    // cart
    await _fetchCartItemsIds.call();
    // favorites
    await _fetchFavoriteProductIdsUseCase.call();
  }

  //
}
