# Ecommerce Flutter App — Clean Architecture
This project is a sample Ecommerce app built using Flutter and structured following Clean Architecture principles. It demonstrates how to organize your codebase with:

Contracts (Abstract classes/interfaces)

Repository pattern

Local & Remote Data Sources


## 📁 Project Structure

```bash
lib
┣ 📂core
┃ ┗ 📂errors
┃   ┣ 📜exceptions.dart
┃   ┗ 📜failures.dart
┣ 📂features
┃ ┗ 📂product
┃   ┣ 📂data
┃   ┃ ┣ 📂data_sources
┃   ┃ ┃ ┣ 📂local
┃   ┃ ┃ ┃ ┗ 📜local_data_source.dart
┃   ┃ ┃ ┗ 📂remote
┃   ┃ ┃   ┗ 📜remote_data_source.dart
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
┗ 📜widget_test.dart

```


## Architecture Layers
### domain/
Defines the contracts and business logic.

entities/ – Plain Dart classes for your core objects (Product).

repositories/ – Abstract class (contract) defining the required repository methods.

usecases/ – Classes for business rules (e.g., GetAllProductsUseCase).

### data/
Contains data sources, models, and the implementation of the repository.

datasources/

remote_product_data_source.dart – Fetches data from APIs.

local_product_data_source.dart – Fetches/saves data locally.

models/ – DTOs used for JSON conversion.

repositories/ – Implements the contract using data sources.