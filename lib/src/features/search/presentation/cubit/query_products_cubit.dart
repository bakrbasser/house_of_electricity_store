import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/core/app/sort_products_helper.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/query_by_category_usecase.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/query_by_name_usecase.dart';
import 'package:house_of_electricity/src/features/product/presentation/cubit/products_list/products_list_cubit.dart';

class QueryProductsCubit extends Cubit<ProductsListState> {
  QueryProductsCubit(this._queryByNameUseCase, this._queryByCategoryUseCase)
    : super(ProductsListInitial());

  final QueryByNameUseCase _queryByNameUseCase;
  final QueryByCategoryUseCase _queryByCategoryUseCase;

  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  Future<void> queryByName(String query) async {
    emit(ProductsListLoading());
    try {
      _products = await _queryByNameUseCase.call(query);
      _filteredProducts = _products;
      if (_products.isEmpty) {
        emit(ProductsLisEmpty());
      } else {
        emit(ProductsListFull(products: _products));
      }
    } catch (e) {
      emit(ProductsListFailed(message: e.toString()));
    }
  }

  Future<void> queryByCategory(int categoryId, int? page) async {
    emit(ProductsListLoading());
    try {
      _products = await _queryByCategoryUseCase.call(categoryId, page);
      _filteredProducts = _products;
      if (_products.isEmpty) {
        emit(ProductsLisEmpty());
      } else {
        emit(ProductsListFull(products: _products));
      }
    } catch (e) {
      emit(ProductsListFailed(message: e.toString()));
    }
  }

  void sort(FiltrationTypes type) {
    emit(ProductsListFull(products: sortProducts(type, _filteredProducts)));
  }
}
