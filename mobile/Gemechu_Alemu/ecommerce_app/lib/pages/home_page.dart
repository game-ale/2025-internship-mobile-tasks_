import 'package:flutter/material.dart';
import '../components/product_card.dart';
import '../components/product_category.dart';
import '../components/rating.dart';
import '../product_models/product_manager.dart';
import '../product_models/product.dart';
import '../common/themes/text_styles.dart';
import '../common/themes/app_colors.dart';
import '../common/widgets/icons_box.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Product(
      name: "Myrunway",
      description:
          "my run way shoe with a sleek design, perfect for formal or smart-casual wear.",
      price: 50.0,
      rating: Rating.good,
      imageURL: 'assets/footwear.png',
      productCategory: ProductCategory.female_shoes,
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
                      Navigator.pushNamed(context, "/searchPage");
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
          Navigator.pushNamed(context, "/addUpdatePage", arguments: "add");
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.secondary,
        child: Icon(Icons.add, size: 40, color: AppColors.background),
      ),
    );
  }
}
