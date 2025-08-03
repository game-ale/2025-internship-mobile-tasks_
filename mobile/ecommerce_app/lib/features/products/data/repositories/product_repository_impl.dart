import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProducts();
        await localDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts);
      } catch (e) {
        return const Left(ServerFailure('Server error'));
      }
    } else {
      try {
        final cachedProducts = await localDataSource.getCachedProducts();
        return Right(cachedProducts);
      } catch (e) {
        return const Left(CacheFailure('No cached products available'));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await remoteDataSource.getProductById(id);
        await localDataSource.cacheProduct(product);
        return Right(product);
      } catch (e) {
        return const Left(ServerFailure('Server error while fetching product'));
      }
    } else {
      try {
        final product = await localDataSource.getProductById(id);
        return Right(product);
      } catch (e) {
        return const Left(CacheFailure('No cached product found'));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        final model = ProductModel.fromEntity(product);
        await remoteDataSource.createProduct(model);
        await localDataSource.cacheProduct(model);
        return Right(model);
      } catch (e) {
        return const Left(ServerFailure('Failed to create product'));
      }
    } else {
      return const Left(ServerFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        final model = ProductModel.fromEntity(product);
        await remoteDataSource.updateProduct(model);
        await localDataSource.cacheProduct(model);
        return Right(model);
      } catch (e) {
        return const Left(ServerFailure('Failed to update product'));
      }
    } else {
      return const Left(ServerFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(int id) async {
    // (failure , unit) is not override (failure ,product)
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        await localDataSource.clearCache();
        return const Right(unit); // Return Unit instead of Product
      } catch (e) {
        return const Left(ServerFailure('Failed to delete product'));
      }
    } else {
      return const Left(ServerFailure('No internet connection'));
    }
  }
}
