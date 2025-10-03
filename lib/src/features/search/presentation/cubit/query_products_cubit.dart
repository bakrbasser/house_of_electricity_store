import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/core/app/sort_products_helper.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/query_by_category_usecase.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/query_by_name_usecase.dart';
import 'package:meta/meta.dart';

part 'query_products_state.dart';

class QueryProductsCubit extends Cubit<QueryProductsState> {
  QueryProductsCubit(this._queryByNameUseCase, this._queryByCategoryUseCase)
    : super(QueryProductsInitial());

  final QueryByNameUseCase _queryByNameUseCase;
  final QueryByCategoryUseCase _queryByCategoryUseCase;

  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  Future<void> queryByName(String query) async {
    emit(QueryProductsLoading());
    try {
      _products = await _queryByNameUseCase.call(query);
      _filteredProducts = _products;
      if (_products.isEmpty) {
        emit(QueryProductsEmpty());
      } else {
        emit(QueryProductsSucceeded(products: _products));
      }
    } catch (e) {
      emit(QueryProductsFailed(message: e.toString()));
    }
  }

  Future<void> queryByCategory(int categoryId, int? page) async {
    emit(QueryProductsLoading());
    try {
      _products = await _queryByCategoryUseCase.call(categoryId, page);
      _filteredProducts = _products;
      if (_products.isEmpty) {
        emit(QueryProductsEmpty());
      } else {
        emit(QueryProductsSucceeded(products: _products));
      }
    } catch (e) {
      emit(QueryProductsFailed(message: e.toString()));
    }
  }

  void sort(FiltrationTypes type) {
    emit(
      QueryProductsSucceeded(products: sortProducts(type, _filteredProducts)),
    );
  }
}
