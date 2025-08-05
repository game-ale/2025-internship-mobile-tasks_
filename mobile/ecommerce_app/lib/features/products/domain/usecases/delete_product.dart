import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository _productRepository;

  DeleteProductUseCase({required ProductRepository productRepository})
      : _productRepository = productRepository;

  Future<Either<Failure, bool>> execute(String id) {
    return _productRepository.deleteProduct(id);
  }
}
