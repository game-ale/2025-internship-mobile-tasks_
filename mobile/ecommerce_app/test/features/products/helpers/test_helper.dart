import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/product/data/data_sources/remote/remote_data_source.dart';
import 'package:ecommerce_app/features/product/data/data_sources/local/local_data_source.dart';
import 'package:ecommerce_app/features/product/domain/usecases/get_product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/get_all_products.dart';
import 'package:ecommerce_app/features/product/domain/usecases/delete_product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/insert_product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/update_product.dart';

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  NetworkInfo,
  SharedPreferences,
  http.Client,
  GetProductUseCase,
  GetAllProductUseCase,
  DeleteProductUseCase,
  InsertProductUseCase,
  UpdateProductUseCase,
])
void main() {}
