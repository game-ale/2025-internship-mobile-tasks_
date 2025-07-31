import 'dart:io';
import '../lib/product.dart';
import '../lib/product_manager.dart';

void main() {
  final productManager = ProductManager();

  while (true) {
    print('''
 E-Commerce CLI
---------------------
1. Add Product
2. View All Products
3. View Product
4. Edit Product
5. Delete Product
6. Exit
---------------------
Choose an option:
''');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter description: ");
        String desc = stdin.readLineSync()!;
        stdout.write("Enter price: ");
        double price = double.tryParse(stdin.readLineSync()!) ?? 0.0;

        productManager.addProduct(Product(name, desc, price));
        break;

      case '2':
        productManager.viewAllProducts();
        break;

      case '3':
        stdout.write("Enter product index (starting from 0): ");
        int index = int.tryParse(stdin.readLineSync()!) ?? -1;
        productManager.viewProduct(index);
        break;

      case '4':
        stdout.write("Enter product index to edit: ");
        int index = int.tryParse(stdin.readLineSync()!) ?? -1;

        stdout.write("New name: ");
        String name = stdin.readLineSync()!;
        stdout.write("New description: ");
        String desc = stdin.readLineSync()!;
        stdout.write("New price: ");
        double price = double.tryParse(stdin.readLineSync()!) ?? 0.0;

        productManager.editProduct(index, name, desc, price);
        break;

      case '5':
        stdout.write("Enter index to delete: ");
        int index = int.tryParse(stdin.readLineSync()!) ?? -1;
        productManager.deleteProduct(index);
        break;

      case '6':
        print(" Exiting...");
        return;

      default:
        print("Invalid choice. Try again.");
    }
  }
}
