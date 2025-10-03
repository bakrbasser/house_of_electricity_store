import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/core/calculate_pagination.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/get_home_page_products_usecase.dart';
import 'package:meta/meta.dart';

part 'products_list_state.dart';

class HomeProductsListCubit extends Cubit<HomeProductsListState> {
  HomeProductsListCubit(this._getHomePageProductsUseCase)
    : super(ProductsListInitial());

  final GetHomePageProductsUseCase _getHomePageProductsUseCase;

  int page = 0;

  bool _hasMore = true;

  Future<void> getHomePageProducts() async {
    emit(ProductsListLoading());
    try {
      final result = await _getHomePageProductsUseCase.call(page);
      if (result.length < globalRange) {
        _hasMore = false;
      }
      emit(ProductsListFull(products: result));
    } catch (e) {
      emit(ProductsListFailed(message: e.toString()));
    }
  }

  Future<void> loadNextPage() async {
    if (_hasMore) {
      page++;
      try {
        await getHomePageProducts();
      } catch (e) {
        emit(
          ProductsListFailed(
            message: 'لا يمكن تحميل بقية المنتجات بسبب خطأ ما',
          ),
        );
      }
    }
  }
}
