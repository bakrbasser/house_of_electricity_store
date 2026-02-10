import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/repositories/product_repository.dart';

class QueryByNameUseCase {
  final ProductsRepository _repository;

  QueryByNameUseCase(this._repository);

  Future<List<Product>> call(String query) async {
    // if (query.isEmpty) {
    //   throw EmptyNameField();
    // }
    return await _repository.queryByName(query);
  }
}
