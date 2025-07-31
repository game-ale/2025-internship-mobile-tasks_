import 'product.dart';
import 'package:task7/components/product_category.dart';
import '../components/rating.dart';

class ProductManager {
  final List<Product> _products = [
    Product(
      name: "Derby Leather Shoe",
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
      price: 120.0,
      rating: Rating.good,
      imageURL: 'assets/shoes.jpg',
      productCategory: ProductCategory.male_shoes,
    ),
    Product(
      name: "Footwear",
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
      price: 120.0,
      rating: Rating.good,
      imageURL: 'assets/footwear1.png',
      productCategory: ProductCategory.female_shoes,
    ),
    Product(
      name: "Derby Leather Shoe",
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
      price: 40.0,
      rating: Rating.average,
      imageURL: 'assets/shoes.jpg',
      productCategory: ProductCategory.male_shoes,
    ),
 
  ];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    print('Product "${product.name}" added successfully.\n');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products available.\n');
      return;
    }
    for (var product in _products) {
      print('${product.name}:\n$product\n');
    }
  }

  int howManyProducts() {
    return _products.length;
  }

  void viewProductByName(String name) {
    final product = _findProductByName(name);
    if (product != null) {
      print('Product Found:\n$product\n');
    } else {
      print('Product "$name" not found.\n');
    }
  }

  void editProductByName(
    String name, {
    String? newName,
    String? newDescription,
    double? newPrice,
  }) {
    final product = _findProductByName(name);
    if (product != null) {
      if (newName != null) product.name = newName;
      if (newDescription != null) product.description = newDescription;
      if (newPrice != null) product.price = newPrice;
      print('Product "$name" updated successfully.\n');
    } else {
      print('Product "$name" not found.\n');
    }
  }

  void deleteProductByName(String name) {
    final product = _findProductByName(name);
    if (product != null) {
      _products.remove(product);
      print('Product "$name" deleted successfully.\n');
    } else {
      print('Product "$name" not found.\n');
    }
  }

  Product? _findProductByName(String name) {
    try {
      return _products.firstWhere(
        (product) => product.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}
