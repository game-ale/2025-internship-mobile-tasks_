🛒 Task 14: Local Data Source Implementation – Ecommerce App
✅ Overview
Implemented local data source to cache products using SharedPreferences for offline support and faster loading.

📌 Features
Implements ProductLocalDatasource interface

Stores and retrieves product data via SharedPreferences

Fallback for no-internet scenarios

🧪 Testing
✅ Unit tests written for ProductLocalDatasourceImpl

Tests cover storing and retrieving products

🔧 Tech Stack
Flutter

SharedPreferences

Dartz (for Either)

Mockito (for unit tests)

🚀 How to Run Tests
```
flutter pub get
flutter test
```
📁 project Folder
Lib
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
┣ 📜main.dart
┗ 📜pubspec.yaml


test 
┣ 📂features
┃ ┗ 📂products
┃   ┣ 📂data
┃   ┃ ┣ 📂data_sources
┃   ┃ ┃ ┗ 📜local_data_source_test.dart
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


📁 Key Files
lib/features/product/data/datasources/product_local_data_source.dart
test/features/product/data/datasources/product_local_data_source_test.dart