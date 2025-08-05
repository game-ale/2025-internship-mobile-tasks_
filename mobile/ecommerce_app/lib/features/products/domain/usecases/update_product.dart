import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class UpdateProductUseCase {
  final ProductRepository _productRepository;

  UpdateProductUseCase({required ProductRepository productRepository})
      : _productRepository = productRepository;

  Future<Either<Failure, bool>> execute(
      String id, Product product) {
    return _productRepository.updateProduct(id, product);
  }
}
