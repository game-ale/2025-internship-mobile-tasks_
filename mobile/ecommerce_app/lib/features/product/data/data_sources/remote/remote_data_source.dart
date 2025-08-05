
import '../../../domain/entities/product.dart';
import '../../models/product_model.dart';

abstract class RemoteDataSource {
  Future<bool> deleteProduct(String productid, String token) {
    throw UnimplementedError();
  }

  Future<ProductModel> getProductById(String productid, String token) {
    throw UnimplementedError();
  }

  Future<bool> insertProduct(Product product, String token) {
    throw UnimplementedError();
  }

  Future<bool> updateProduct(String productid, Product product, String token) {
    throw UnimplementedError();
  }

  Future<List<ProductModel>> getAllProducts(String token) {
    throw UnimplementedError();
  }
}