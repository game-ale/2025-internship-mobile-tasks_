import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../models/product_model.dart';

abstract class LocalDataSource {
  Future<ProductModel> getProduct();
  Future<void> cacheProduct();
  Future<String?> getAccessToken();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _sharedPreferences;

  LocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<void> cacheProduct() {
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProduct() {
    final jsonString = _sharedPreferences.getString('cachedProduct');

    if (jsonString != null) {
      return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    }

    throw CacheException();
  }
  @override
  Future<String?> getAccessToken() {
    final token = _sharedPreferences.getString('accessToken');
    if (token != null) {
      return Future.value(token);
    }
    return Future.value(null);
  }
}
