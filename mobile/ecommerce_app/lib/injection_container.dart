import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/product/data/data_sources/local/local_data_source.dart';
import 'features/product/data/data_sources/remote/remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/delete_product.dart';
import 'features/product/domain/usecases/get_all_products.dart';
import 'features/product/domain/usecases/get_product.dart';
import 'features/product/domain/usecases/insert_product.dart';
import 'features/product/domain/usecases/update_product.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ProductBloc(
        getAllProductsUsecase: sl(),
        getProductUsecase: sl(),
        updateProductUsecase: sl(),
        insertProductUsecase: sl(),
        deleteProductUsecase: sl(),
      ));

  // Usecases
  sl.registerFactory(() => GetAllProductUseCase(productRepository: sl()));
  sl.registerFactory(() => GetProductUseCase(productRepository: sl()));
  sl.registerFactory(() => DeleteProductUseCase(productRepository: sl()));
  sl.registerFactory(() => InsertProductUseCase(productRepository: sl()));
  sl.registerFactory(() => UpdateProductUseCase(productRepository: sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl(), userLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: sl()));

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
