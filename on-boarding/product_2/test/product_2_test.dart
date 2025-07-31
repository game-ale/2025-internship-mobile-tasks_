import 'package:test/test.dart';
import 'package:product_2/product.dart';
import 'package:product_2/product_manager.dart';

void main() {
  group('Product', () {
    test('should create a product with correct properties', () {
      final product = Product('Laptop', 'Gaming laptop', 1999.99);
      expect(product.name, 'Laptop');
      expect(product.description, 'Gaming laptop');
      expect(product.price, 1999.99);
    });

    test('should update product properties correctly', () {
      final product = Product('Old', 'Old desc', 100);
      product.name = 'New';
      product.description = 'New desc';
      product.price = 200;

      expect(product.name, 'New');
      expect(product.description, 'New desc');
      expect(product.price, 200);
    });
  });

  group('ProductManager', () {
    final manager = ProductManager();

    test('should add product to list', () {
      final product = Product('Phone', 'Smartphone', 500);
      manager.addProduct(product);
      expect(manager.products.length, greaterThan(0));
    });

    test('should delete product from list', () {
      final initialCount = manager.products.length;
      if (initialCount > 0) {
        manager.deleteProduct(0);
        expect(manager.products.length, initialCount - 1);
      }
    });
  });
}
