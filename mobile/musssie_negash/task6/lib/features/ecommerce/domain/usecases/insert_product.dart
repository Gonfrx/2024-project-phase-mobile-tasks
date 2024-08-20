import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class InsertProduct {
  //fix this code
  final ProductRepository repository;

  InsertProduct(this.repository);

  Future<Either<Failure, Unit>> execute(Product product) async {
    return repository.insertProduct(product);
  }
}
