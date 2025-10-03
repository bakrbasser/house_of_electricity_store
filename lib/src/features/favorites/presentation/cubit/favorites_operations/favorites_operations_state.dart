part of 'favorites_operations_cubit.dart';

@immutable
sealed class FavoritesOperationsState {}

final class FavoritesOperationsInitial extends FavoritesOperationsState {}

final class FavoritesOperationsFailed extends FavoritesOperationsState {
  FavoritesOperationsFailed({required this.message});

  final String message;
}

final class FavoritesOperationsSucceeded extends FavoritesOperationsState {
  final String? message;

  FavoritesOperationsSucceeded({this.message});
}

final class FavoritesOperationsLoading extends FavoritesOperationsState {}
