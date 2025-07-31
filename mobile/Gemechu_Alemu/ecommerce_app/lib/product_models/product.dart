import 'package:task6/components/product_category.dart';

import '../components/rating.dart';

class Product {
  String _name;
  String _description;
  double _price;
  Rating _rating;
  String _imageURL;
  ProductCategory _productCategory;

  Product({
    required String name,
    required String description,
    required double price,
    required Rating rating,
    required String imageURL,
    required ProductCategory productCategory,
  }) : _name = name,
       _description = description,
       _price = price,
       _rating = rating,
       _imageURL = imageURL,
       _productCategory = productCategory;

  String get name => _name;
  set name(String name) => _name = name;

  String get imageURL => _imageURL;
  set imageURL(String imageURL) => _imageURL = imageURL;

  ProductCategory get productCategory => _productCategory;
  set productCategory(ProductCategory productCategory) =>
      _productCategory = productCategory;

  String get description => _description;
  set description(String description) => _description = description;

  double get price => _price;
  set price(double price) => _price = price;

  Rating get rating => _rating;
  set rating(Rating rating) => _rating = rating;

  @override
  String toString() {
    return 'Name: $_name\nDescription: $_description\nPrice: \$$_price';
  }
}
