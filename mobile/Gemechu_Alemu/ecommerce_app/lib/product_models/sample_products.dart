import 'product.dart';
import '../components/rating.dart';
import '../components/product_category.dart';

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
      name: "Derby Leather Shoe",
      description:
          "Comfortable sneakers for daily wear, stylish and versatile.",
      price: 120.0,
      rating: Rating.good,
      imageURL: 'assets/shoes.jpg',
      productCategory: ProductCategory.male_shoes,
    ),
    Product(
      name: "Derby Leather Shoe",
      description:
          "This stylish platform shoe features a sleek, minimalist design with a smooth white leather upper and bold black accents. Its chunky black sole adds height and presence, making it a statement piece perfect for modern, edgy outfits. The clean stitching detail and classic lace-up front provide both structure and sophistication, while the thick sole offers durability and comfort. Ideal for fashion-forward individuals, this shoe balances contemporary flair with timeless appeal. Whether paired with jeans, skirts, or tailored pants, it effortlessly elevates any look, making it a versatile addition to any wardrobe. Perfect for day-to-night wear with bold confidence.",
      price: 40.0,
      rating: Rating.average,
      imageURL: 'assets/shoe_4.jpg',
      productCategory: ProductCategory.male_shoes,
    ),
    Product(
      name: "Adidas Sneakers",
      description:
          "Comfortable sneakers for daily wear, stylish and versatile.",
      price: 40.0,
      rating: Rating.average,
      imageURL: 'assets/shoes.jpg',
      productCategory: ProductCategory.male_shoes,
    ),
    Product(
      name: "Nike Sneakers",
      description:
          "Comfortable sneakers for daily wear, stylish and versatile.",
      price: 40.0,
      rating: Rating.average,
      imageURL: 'assets/shoes.jpg',
      productCategory: ProductCategory.male_shoes,
    ),
  ];