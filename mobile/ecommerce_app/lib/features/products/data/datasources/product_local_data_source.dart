
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../features/products/domain/entities/product.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProducts(List<Product> products);
  Future<List<Product>> getCachedProducts();
  Future<List<Product>> getLastProducts();
  Future<ProductModel> getProductById(int id); 
  Future<void> cacheProduct(ProductModel productToCache); 
  Future<void> clearCache();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const cachedProductsKey = 'CACHED_PRODUCTS';

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheProducts(List<Product> products) async {
    final productModels = products.map((e) => ProductModel.fromEntity(e)).toList();
    final jsonString = json.encode(productModels.map((e) => e.toJson()).toList());
    await sharedPreferences.setString(cachedProductsKey, jsonString);
  }

  @override
  Future<List<Product>> getCachedProducts() async {
    final jsonString = sharedPreferences.getString(cachedProductsKey);

    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<Product>> getLastProducts() async {
    final cached = await getCachedProducts();
    return cached.take(5).toList();
  }

  @override
  Future<void> cacheProduct(ProductModel productToCache) async {
    final current = await getCachedProducts();
    final updated = [...current, productToCache];
    final jsonString = json.encode(updated.map((e) => (e as ProductModel).toJson()).toList());
    await sharedPreferences.setString(cachedProductsKey, jsonString);
  }

  @override
  Future<void> clearCache() async {
    await sharedPreferences.remove(cachedProductsKey);
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final jsonString = sharedPreferences.getString('CACHED_PRODUCTS');
    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);
      final List<ProductModel> products = decodedJson
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();

      try {
        return products.firstWhere((product) => product.id == id);
      } catch (e) {
        throw CacheException(); // or return Future.error(CacheException());
      }
    } else {
      throw CacheException();
    }
  }
}
