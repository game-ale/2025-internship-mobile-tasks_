import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/product/data/data_sources/remote/remote_data_source.dart';
import 'package:ecommerce_app/features/product/data/data_sources/local/local_data_source.dart';

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  NetworkInfo,
  SharedPreferences, 
])
void main() {}
