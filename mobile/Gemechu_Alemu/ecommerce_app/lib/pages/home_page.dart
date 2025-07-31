import 'package:flutter/material.dart';
import 'package:task7/pages/add_update_page.dart';
import 'package:task7/components/product_card.dart';
import 'package:task7/components/product_category.dart';
import 'package:task7/components/rating.dart';
import 'package:task7/pages/search_page.dart';
import '../product_models/product_manager.dart';

import '../product_models/product.dart';
// Theme files
import '../common/themes/app_colors.dart';
import '../common/themes/text_styles.dart';
// Widget files
import '../common/widgets/icons_box.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Product(
      name: "Derby Leather Shoe",
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
      price: 120.0,
      rating: Rating.good,
      imageURL: 'assets/shoes.jpg',
      productCategory: ProductCategory.male_shoes,
    );

    final productManager = ProductManager();
    productManager.addProduct(product);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade700, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // same as container
                      child: Image.asset(
                        "assets/person.png",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("July 14,2023", style: AppTextStyles.dateText),
                        Row(
                          children: [
                            Text(
                              "Hello, ",
                              style: AppTextStyles.welcomeTextHello,
                            ),
                            Text(
                              "Yohannes",
                              style: AppTextStyles.welcomeTextName,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconsBox(
                    child: Icon(
                      Icons.notifications_on,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Available Products", style: AppTextStyles.bigheading),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    child: IconsBox(
                      child: Icon(Icons.search, color: AppColors.borderPrimary),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productManager.howManyProducts(),
                itemBuilder: (context, index) {
                  final product = productManager.products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUpdatePage()),
          );
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.secondary,
        child: Icon(Icons.add, size: 40, color: AppColors.background),
      ),
    );
  }
}
