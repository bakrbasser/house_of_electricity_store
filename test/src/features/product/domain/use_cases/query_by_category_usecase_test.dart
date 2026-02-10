import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/domain/repositories/categories_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';
import 'package:house_of_electricity/src/features/product/domain/repositories/product_repository.dart';
import 'package:house_of_electricity/src/features/product/domain/use_cases/query_by_category_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoryRepo extends Mock implements CategoryRepository {}

class MockProductRepo extends Mock implements ProductsRepository {}

final mockSubCategories = {
  1: [
    Category(
      id: 2,
      name: 'name',
      description: 'description',
      imageUrl: 'imageUrl',
      parentId: 1,
      iconUrl: 'iconUrl',
    ),
  ],
};

final mockProduct = Product(
  id: 1,
  name: 'name',
  description: 'description',
  price: 10.0,
  quantity: 5,
  imageUrl: 'imageUrl',
  categoryId: 2,
  createdAt: DateTime(4),
  isAvailable: true,
  isDiscounted: true,
);

void main() {
  test('test fetching products by category', () async {
    final catRepo = MockCategoryRepo();
    final prRepo = MockProductRepo();
    final queryByCategoryUseCase = QueryByCategoryUseCase(prRepo, catRepo);
    when(() => catRepo.getSubCategories()).thenAnswer((_) => mockSubCategories);
    when(
      () => prRepo.queryByCategory(any(), any()),
    ).thenAnswer((invocation) async => [mockProduct]);
    final product = await queryByCategoryUseCase.call(1, null);
    expect(product[0], mockProduct);
  });
}
