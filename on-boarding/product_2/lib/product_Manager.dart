import 'product.dart';

class ProductManager {
  List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    print(" Product added!");
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print(" No products available.");
    } else {
      for (int i = 0; i < _products.length; i++) {
        print("\nProduct ${i + 1}:");
        print(_products[i]);
      }
    }
  }

  void viewProduct(int index) {
    if (_isValidIndex(index)) {
      print(_products[index]);
    } else {
      print(" Product not found.");
    }
  }

  void editProduct(int index, String name, String description, double price) {
    if (_isValidIndex(index)) {
      _products[index]
        ..name = name
        ..description = description
        ..price = price;
      print("  Product updated.");
    } else {
      print("  Invalid product index.");
    }
  }

  void deleteProduct(int index) {
    if (_isValidIndex(index)) {
      _products.removeAt(index);
      print(" Product deleted.");
    } else {
      print(" Product not found.");
    }
  }

  bool _isValidIndex(int index) => index >= 0 && index < _products.length;
  List<Product> get products => _products;
}
