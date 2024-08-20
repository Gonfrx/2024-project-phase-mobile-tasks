import 'package:clean_arc_practice/features/ecommerce/domain/entities/product.dart';
import 'package:clean_arc_practice/features/ecommerce/domain/usecases/insert_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  MockProductRepository mockProductRepostory = MockProductRepository();
  InsertProduct insertProduct = InsertProduct(mockProductRepostory);

  setUp(() {
    mockProductRepostory = MockProductRepository();
    insertProduct = InsertProduct(mockProductRepostory);
  });
  final testInsertProduct = Product(
    id: '1',
    name: 'product',
    info: 'description',
    price: 100,
    image: 'image',
  );
  test('', () {});

  test('Insert product should return either Failure or Unit', () async {
    // Arrange
    when(mockProductRepostory.insertProduct(testInsertProduct))
        .thenAnswer((_) async => const Right(unit));

    // Act
    final result = await insertProduct.execute(testInsertProduct);

    // Assert
    expect(result, const Right(unit));
  });
}
