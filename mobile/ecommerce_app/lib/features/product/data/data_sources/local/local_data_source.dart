import 'dart:convert';
import '../../models/product_model.dart';
abstract class LocalDataSource {
  Future<ProductModel> getProduct();
  Future<void> cacheProduct();
}