import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> getProduct(String id);

  Future<Either<Failure, bool>> createProduct(Product product);

  Future<Either<Failure, bool>> updateProduct(
      String id, Product product);

  Future<Either<Failure, bool>> deleteProduct(String id);

  Future<Either<Failure, List<Product>>> getAllProduct();
}
