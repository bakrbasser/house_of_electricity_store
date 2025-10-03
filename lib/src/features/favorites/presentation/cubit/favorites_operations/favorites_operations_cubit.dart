import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/add_to_favorites_use_case.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/get_favorite_product_ids_use_case.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/remove_from_favorites_use_case.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:meta/meta.dart';

part 'favorites_operations_state.dart';

class FavoritesOperationsCubit extends Cubit<FavoritesOperationsState> {
  FavoritesOperationsCubit(
    this._removeFromFavoritesUseCase,
    this._addToFavoritesUseCase,
    this._getFavoriteProductIdsUseCase,
  ) : super(FavoritesOperationsInitial());

  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final GetFavoriteProductIdsUseCase _getFavoriteProductIdsUseCase;

  Future<void> addToFavorites(Product product) async {
    emit(FavoritesOperationsLoading());
    try {
      await _addToFavoritesUseCase.call(product);
      emit(FavoritesOperationsSucceeded(message: 'Added to favorites'));
    } catch (e) {
      emit(FavoritesOperationsFailed(message: e.toString()));
    }
  }

  Future<void> removeFromFavorites(int productId) async {
    emit(FavoritesOperationsLoading());
    try {
      await _removeFromFavoritesUseCase.call(productId);
      emit(FavoritesOperationsSucceeded(message: 'Removed from favorites'));
    } catch (e) {
      emit(FavoritesOperationsFailed(message: e.toString()));
    }
  }

  bool isInFavorites(int productId) {
    return _getFavoriteProductIdsUseCase.call().contains(productId);
  }
}
