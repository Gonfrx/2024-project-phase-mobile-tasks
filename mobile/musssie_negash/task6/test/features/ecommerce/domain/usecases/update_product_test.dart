import 'package:clean_arc_practice/features/ecommerce/domain/entities/product.dart';
import 'package:clean_arc_practice/features/ecommerce/domain/usecases/update_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  MockProductRepository mockProductRepository = MockProductRepository();
  UpdateProduct updateProduct = UpdateProduct(mockProductRepository);

  setUp(() {
    mockProductRepository = MockProductRepository();
    updateProduct = UpdateProduct(mockProductRepository);
  });
  final testUpdateProduct = Product(
    id: '1',
    name: 'product',
    info: 'description',
    price: 100,
    image: 'image',
  );
  test(
      'should update a product from repository and return either a unit or failure',
      () async {
    //arange
    when(mockProductRepository.updateProduct(testUpdateProduct))
        .thenAnswer((_) async => const Right(unit));
    //act
    final result = await updateProduct.execute(testUpdateProduct);
    //assert
    expect(result, const Right(unit));
  });
}
