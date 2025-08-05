import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';


class VeiwProductUseCase {
  final ProductRepository _productRepository;

  VeiwProductUseCase({required ProductRepository productRepository})
      : _productRepository = productRepository;
  Future<Either<Failure, Product>> execute(String id) {
    return _productRepository.getProduct(id);
  }
}