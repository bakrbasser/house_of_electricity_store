part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesListState {}

final class FavoritesInitial extends FavoritesListState {}

final class FavoritesLoading extends FavoritesListState {}

final class FavoritesFailed extends FavoritesListState {
  final String message;

  FavoritesFailed({required this.message});
}

final class FavoritesFull extends FavoritesListState {
  final List<Product> favorites;

  FavoritesFull({required this.favorites});
}
