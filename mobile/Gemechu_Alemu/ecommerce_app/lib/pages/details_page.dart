import 'package:flutter/material.dart';
import 'package:task7/common/themes/app_colors.dart';
import 'package:task7/common/themes/text_styles.dart';
import 'package:task7/components/product_category.dart';
import '../product_models/product.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(product.imageURL),
                Positioned(
                  left: 20,
                  top: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.background,
                      ),
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              // This makes the inner content take available space
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.productCategory.displayName,
                            style: AppTextStyles.descriptionPageCategoryShow,
                          ),
                          Text(
                            "⭐(${product.rating.value})",
                            style: AppTextStyles.descriptionPageCategoryShow,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.name, style: AppTextStyles.bigheading),
                          Text(
                            '\$${product.price}',
                            style: AppTextStyles.priceText,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text("Size: ", style: AppTextStyles.heading2),
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            final number = 39 + index;
                            final isTarget = index == 2; 
                            return Container(
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isTarget ?  AppColors.secondary : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                  number.toString(),
                                  style: AppTextStyles.cardProductName.copyWith(
                                  color: index == 2 ? Colors.white : Colors.black, 
  ),
),

                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        product.description,
                        softWrap: true,
                        style: AppTextStyles.bodyText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 152,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("DELETE", style: AppTextStyles.deleteButton),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 152,
                    height: 50,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("UPDATE", style: AppTextStyles.updateButton),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

