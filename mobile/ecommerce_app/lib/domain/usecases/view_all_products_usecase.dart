import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewAllProductsUsecase {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
