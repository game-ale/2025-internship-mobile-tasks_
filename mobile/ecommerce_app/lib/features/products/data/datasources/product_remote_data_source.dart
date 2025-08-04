import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(String id);
  Future<void> createProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(
      Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v3/products',
      ),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap =
          json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> jsonList = jsonMap['data'] as List<dynamic>;
      return jsonList
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException('something went wrong');
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await client.get(
      Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v3/products/$id',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final dynamic jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      return ProductModel.fromJson(jsonMap['data'] as Map<String, dynamic>);
    } else {
      throw ServerException('something went wrong');
    }
  }

  @override
  Future<String> createProduct(ProductModel product) async {
    final productJson = product.toJson();
    return await client
        .post(
          Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v3/products',
          ),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(productJson),
        )
        .then((response) {
          if (response.statusCode != 201) {
            throw ServerException('Failed to create product');
          }
          return response.body;
        });
  }

  @override
  Future<void> deleteProduct(String id) {
    return client
        .delete(
          Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v3/products/$id',
          ),
          headers: {'Content-Type': 'application/json'},
        )
        .then((response) {
          if (response.statusCode != 204) {
            throw ServerException('Failed to delete product');
          }
        });
  }

  @override
  Future<void> updateProduct(ProductModel product) {
    final productJson = product.toJson();
    return client
        .put(
          Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v3/products/${product.id}',
          ),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(productJson),
        )
        .then((response) {
          if (response.statusCode != 200) {
            throw ServerException('Failed to update product');
          }
        });
  }
}