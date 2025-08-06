import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/remote/remote_data_source.dart';
import '../data_sources/local/local_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final LocalDataSource _LocalDataSource;

  ProductRepositoryImpl(
      {required RemoteDataSource remoteDataSource,
      required NetworkInfo networkInfo,
      required LocalDataSource LocalDataSource})
      : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo,
        _LocalDataSource = LocalDataSource;

  @override
  Future<Either<Failure, bool>> deleteProduct(String productid) async {
    try {
      final token = await _LocalDataSource.getAccessToken();
      final result = await _remoteDataSource.deleteProduct(productid, token!);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(String productid) async {
    try {
      final token = await _LocalDataSource.getAccessToken();
      final result = await _remoteDataSource.getProductById(productid, token!);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, bool>> insertProduct(Product product) async {
    try {
      final token = await _LocalDataSource.getAccessToken();
      final result = await _remoteDataSource.insertProduct(product, token!);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProduct(
      String productid, Product product) async {
    try {
      final token = await _LocalDataSource.getAccessToken();
      final result =
          await _remoteDataSource.updateProduct(productid, product, token!);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final token = await _LocalDataSource.getAccessToken();
      final result = await _remoteDataSource.getAllProducts(token!);
      // Assuming result is a list of DTOs that need to be converted to entities
      return Right(result.map((product) => product.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
