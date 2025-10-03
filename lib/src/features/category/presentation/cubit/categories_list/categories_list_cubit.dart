import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/domain/use_cases/get_all_categories_usecase.dart';
import 'package:house_of_electricity/src/features/category/domain/use_cases/get_subcategories_usecase.dart';
import 'package:meta/meta.dart';

part 'categories_list_state.dart';

class CategoriesListCubit extends Cubit<CategoriesListState> {
  CategoriesListCubit(
    this._getAllCategoriesUseCase,
    this._getSubcategoriesUseCase,
  ) : super(CategoriesListInitial());

  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetSubcategoriesUseCase _getSubcategoriesUseCase;

  void getCategories() {
    emit(CategoriesListLoading());
    final mainCategories = _getAllCategoriesUseCase.call();
    final subCategories = _getSubcategoriesUseCase.call();
    emit(
      CategoriesListLoaded(
        mainCategories: mainCategories,
        subCategories: subCategories,
      ),
    );
  }
}
