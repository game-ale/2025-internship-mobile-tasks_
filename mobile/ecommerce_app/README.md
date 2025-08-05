This task is part of the Ecommerce app development using Flutter and Clean Architecture (TDD). The goal is to implement the ProductRepositoryImpl class and write tests to verify its behavior.

📌 Requirements
Implement repository contract from the domain layer.

Use local datasource when the network is unavailable.

Use remote datasource when the network is available.

Write tests for ProductRepositoryImpl.

Push the implementation to GitHub and submit the link.

🛠️ Implementation
ProductRepositoryImpl: Implements all repository logic.

Local Data Source: Returns cached data if offline.

Remote Data Source: Fetches data from API if online.

Tests: Unit tests to validate repository behavior.

## 📁 Project Structure

```
┣ 📂core
┃ ┣ 📂errors
┃ ┃ ┣ 📜exceptions.dart
┃ ┃ ┗ 📜failures.dart
┃ ┗ 📂network
┃   ┗ 📜network_info.dart
┣ 📂features
┃ ┗ 📂product
┃   ┣ 📂data
┃   ┃ ┣ 📂data_sources
┃   ┃ ┃ ┣ 📂local
┃   ┃ ┃ ┃ ┗ 📜local_data_source.dart
┃   ┃ ┃ ┗ 📂remote
┃   ┃ ┃   ┗ 📜remote_data_source.dart
┃   ┃ ┣ 📂models
┃   ┃ ┃ ┗ 📜product_model.dart
┃   ┃ ┗ 📂repositories
┃   ┃   ┗ 📜product_repository_impl.dart
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

```
test
┣ 📂features
┃ ┗ 📂products
┃   ┣ 📂data
┃   ┃ ┣ 📂models
┃   ┃ ┃ ┗ 📜product_model_test.dart
┃   ┃ ┗ 📂repositories
┃   ┃   ┗ 📜product_repository_impl_test.dart
┃   ┣ 📂domain
┃   ┃ ┗ 📂usecases
┃   ┃   ┣ 📜create_product_test.dart
┃   ┃   ┣ 📜delete_product_test.dart
┃   ┃   ┣ 📜get_all_products_test.dart
┃   ┃   ┣ 📜get_product_test.dart
┃   ┃   ┗ 📜update_product_test.dart
┃   ┗ 📂helpers
┃     ┣ 📜json_reader.dart
┃     ┣ 📜test_helper.dart
┃     ┗ 📜test_helper.mocks.dart
┗ 📜widget_test.dart


```