import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/features/favorites/domain/use_cases/get_favorites_use_case.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesListCubit extends Cubit<FavoritesListState> {
  FavoritesListCubit(this._getFavoritesUseCase) : super(FavoritesInitial());

  final GetFavoritesUseCase _getFavoritesUseCase;

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
    try {
      final favorites = await _getFavoritesUseCase.call();
      emit(FavoritesFull(favorites: favorites));
    } catch (e) {
      emit(FavoritesFailed(message: e.toString()));
    }
  }
}
