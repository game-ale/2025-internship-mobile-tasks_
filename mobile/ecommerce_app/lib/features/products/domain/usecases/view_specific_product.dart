import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewProductUsecase implements Usecase<Product, String> {
  final ProductRepository repository;
  const ViewProductUsecase(this.repository);
  @override
  Future<Either<Failure, Product>> call(String id) {
    return repository.getProductById(int.parse(id)); 
  }
}
