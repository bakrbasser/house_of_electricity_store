import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

abstract class QueryUsecase {
  Future<List<Product>> call(dynamic queryingElement, int? page);
}
