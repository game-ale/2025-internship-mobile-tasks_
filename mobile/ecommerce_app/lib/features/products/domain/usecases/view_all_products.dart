import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class VeiwAllProductUseCase {
  final ProductRepository _productRepository;

  VeiwAllProductUseCase({required ProductRepository productRepository})
      : _productRepository = productRepository;
  Future<Either<Failure, List<Product>>> execute() {
    return _productRepository.getAllProduct();
  }
}

