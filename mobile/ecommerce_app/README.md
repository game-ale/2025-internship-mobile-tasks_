***Dependende Injection is Added ***
┣ 📂core
┃ ┣ 📂constants
┃ ┃ ┗ 📜constants.dart
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
┃   ┣ 📂domain
┃   ┃ ┣ 📂entities
┃   ┃ ┃ ┗ 📜product.dart
┃   ┃ ┣ 📂repositories
┃   ┃ ┃ ┗ 📜product_repository.dart
┃   ┃ ┗ 📂usecases
┃   ┃   ┣ 📜delete_product.dart
┃   ┃   ┣ 📜get_all_products.dart
┃   ┃   ┣ 📜get_product.dart
┃   ┃   ┣ 📜insert_product.dart
┃   ┃   ┗ 📜update_product.dart
┃   ┗ 📂presentation
┃     ┗ 📂bloc
┃       ┣ 📜product_bloc_event.dart
┃       ┣ 📜product_bloc_state.dart
┃       ┗ 📜product_bloc.dart
┣ 📜injection_container.dart
┗ 📜main.dart
