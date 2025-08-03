import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/add_update_page.dart';
import '../pages/details_page.dart';
import '../pages/search_page.dart';
import '../product_models/product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/searchPage": (context) => SearchPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/details') {
          final product = settings.arguments as Product;

          return MaterialPageRoute(
            builder: (context) => DetailsPage(product: product),
          );
        } else if (settings.name == '/addUpdatePage') {
          final product = settings.arguments as String;

          return MaterialPageRoute(
            builder: (context) => AddUpdatePage(pageType: product),
          );
        }
        return null;
      },
    );
  }
}
