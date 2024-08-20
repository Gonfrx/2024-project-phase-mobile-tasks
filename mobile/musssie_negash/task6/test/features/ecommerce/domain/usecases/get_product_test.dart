import 'package:clean_arc_practice/features/ecommerce/domain/entities/product.dart';
import 'package:clean_arc_practice/features/ecommerce/domain/usecases/get_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  MockProductRepository mockProductRepository = MockProductRepository();
  GetProduct getProduct = GetProduct(mockProductRepository);

  setUp(() {
    mockProductRepository = MockProductRepository();
    getProduct = GetProduct(mockProductRepository);
  });

  final testGetProduct = Product(
    id: '1',
    name: 'product',
    info: 'description',
    price: 100,
    image: 'image',
  );
  String testId = '1';

  test(
      'should get a product from repository and return either a product or Failure',
      () async {
    //arange
    when(mockProductRepository.getProduct(testId))
        .thenAnswer((_) async => Right(testGetProduct));
    //act
    final result = await getProduct.execute(testId);
    //assert
    expect(result, Right(testGetProduct));
  });
}
