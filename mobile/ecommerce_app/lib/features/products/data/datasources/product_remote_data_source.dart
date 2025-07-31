import '../../domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(int id);
  Future<Product> updateProduct(Product product);
  Future<Product> deleteProduct(int id);
  Future<Product> createProduct(Product product);
  Future<void> cacheProduct(Product product);
  Future<void> cacheProducts(List<Product> product);
  Future<List<Product>> getCachedProduct();
  Future<Product> getCachedProductById(String id);
  Future<void> clearCache();
}
