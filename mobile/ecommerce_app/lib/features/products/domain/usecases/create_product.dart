import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../../../core/usecases/usecase.dart';

class CreateProductUsecase implements Usecase< Product,Product> {

  final ProductRepository repository;
  const CreateProductUsecase(this.repository);
@override
  Future<Either<Failure, Product>> call(Product product) {
    return repository.createProduct(product);
  }
}
