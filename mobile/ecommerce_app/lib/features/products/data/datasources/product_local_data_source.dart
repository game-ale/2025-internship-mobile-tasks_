import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<Product>> getProducts();
  Future<Product> getProductById (int id);
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(Product product);


  Future<List<Product>> getLastProducts();
  Future<void> cacheProducts(List<Product> products);
  Future<List<Product>> getCachedProducts();
  Future<void> cacheProduct(ProductModel productToCache);

  Future<void> clearCache();
}
