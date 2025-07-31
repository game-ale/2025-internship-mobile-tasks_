import 'package:flutter/material.dart';
//import 'package:task6/constants.dart';
import 'package:task7/common/themes/text_styles.dart';
//import 'package:task6/common/themes/app_colors.dart';
import 'package:task7/pages/details_page.dart';
import 'package:task7/components/product_category.dart';
import '../product_models/product.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    this.imageAspectRatio = 366 / 160,
    required this.product,
    Key? key,
  }) : assert(imageAspectRatio > 0),
       super(key: key);

  final double imageAspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);

    final imageWidget = Image.asset(
      product.imageURL,
      fit: BoxFit.cover,
      height: 160,
      width: 366,
    );

    return Card(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(product: product),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: imageAspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.directional(
                  topStart: Radius.circular(15),
                  topEnd: Radius.circular(15),
                ),
                child: imageWidget,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: AppTextStyles.cardProductName,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        "\$${product.price}",
                        style: AppTextStyles.cardPriceText,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.productCategory.displayName}', // Showing price directly without formatting
                        style: AppTextStyles.cardCategoryText,
                      ),
                      Text(
                        '⭐ (${product.rating.value})',
                        style: AppTextStyles.cardCategoryText,
                      ),
                    ],
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
