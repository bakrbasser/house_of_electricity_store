part of 'categories_list_cubit.dart';

@immutable
sealed class CategoriesListState {}

final class CategoriesListInitial extends CategoriesListState {}

final class CategoriesListFailed extends CategoriesListState {}

final class CategoriesListLoaded extends CategoriesListState {
  final List<Category> mainCategories;
  final Map<int, List<Category>> subCategories;

  List<Category>? subCategory(int index) =>
      subCategories[mainCategories[index].id];

  CategoriesListLoaded({
    required this.mainCategories,
    required this.subCategories,
  });
}

final class CategoriesListLoading extends CategoriesListState {}
