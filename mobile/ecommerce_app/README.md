#  Flutter eCommerce App (Clean Architecture)

A modular and testable eCommerce Flutter app built with **Clean Architecture**, **Mockito**, and **Dartz**, following best practices for scalability, separation of concerns, and maintainability.

---

##  Architecture Overview

This project follows the **Clean Architecture** pattern to divide responsibilities and ensure testability:

###  Layers


- **Domain Layer**  
  Business logic, entities, repository interfaces, and use cases.

- **Data Layer**  
  Data models, API/database implementations, and data source logic.

- **Core Layer**  
  Common/shared code across the app, like constants and error handling.

---

## 📁 Project Structure

```bash
lib
┣ 📂core
┃ ┗ 📂errors
┃   ┗ 📜failures.dart
┣ 📂features
┃ ┗ 📂product
┃   ┣ 📂data
┃   ┃ ┗ 📂models
┃   ┃   ┗ 📜product_model.dart
┃   ┗ 📂domain
┃     ┣ 📂entities
┃     ┃ ┗ 📜product.dart
┃     ┣ 📂repositories
┃     ┃ ┗ 📜product_repository.dart
┃     ┗ 📂usecases
┃       ┣ 📜delete_product.dart
┃       ┣ 📜get_all_products.dart
┃       ┣ 📜get_product.dart
┃       ┣ 📜insert_product.dart
┃       ┗ 📜update_product.dart
┗ 📜main.dart
```

```bash
test
┣ 📂core
┣ 📂features
┃ ┗ 📂products
┃   ┣ 📂data
┃   ┃ ┗ 📂models
┃   ┃   ┗ 📜product_model_test.dart
┃   ┣ 📂domain
┃   ┃ ┗ 📂usecases
┃   ┃   ┣ 📜create_product_test.dart
┃   ┃   ┣ 📜delete_product_test.dart
┃   ┃   ┣ 📜get_all_products_test.dart
┃   ┃   ┣ 📜get_product_test.dart
┃   ┃   ┗ 📜update_product_test.dart
┃   ┗ 📂helpers
┃     ┣ 📜json_reader.dart
┃     ┗ 📜test_helper.dart
┗ 📜widget_test.dar

```
