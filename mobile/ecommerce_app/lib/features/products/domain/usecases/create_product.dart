import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateProductUseCase {
  final ProductRepository _productRepository;

  CreateProductUseCase({required ProductRepository productRepository})
      : _productRepository = productRepository;

  Future<Either<Failure, bool>> execute(Product product) {
    return _productRepository.createProduct(product);
  }
}
