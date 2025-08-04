import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewAllProductsUsecase implements Usecase <List<Product>, NoParams> {
  final ProductRepository repository;

  const ViewAllProductsUsecase(this.repository);

  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return repository.getAllProducts();
  }
}
