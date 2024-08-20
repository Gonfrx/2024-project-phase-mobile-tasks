import 'package:clean_arc_practice/features/ecommerce/domain/usecases/delete_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  MockProductRepository mockProductRepository = MockProductRepository();
  DeleteProduct deleteProduct = DeleteProduct(mockProductRepository);

  setUp(() {
    mockProductRepository = MockProductRepository();
    deleteProduct = DeleteProduct(mockProductRepository);
  });
  String testId = '1';
  test(
      'should delete a product from repository and return either a unit or failure',
      () async {
    //arange
    when(mockProductRepository.deleteProduct(testId))
        .thenAnswer((_) async => const Right(unit));
    //act
    final result = await deleteProduct.call(testId);
    //assert
    expect(result, const Right(unit));
  });
}
