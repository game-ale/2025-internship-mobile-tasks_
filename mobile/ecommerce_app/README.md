# 🛒 Domain Layer Refactoring for eCommerce App

This project focuses on **refactoring the domain layer** of an eCommerce mobile application
 using the principles of **Clean Architecture** and **Test-Driven Development (TDD)**.
  The goal is to create a robust and scalable foundation for managing products within the app, supporting full CRUD (Create, Read, Update, Delete) operations.

---

## 🚀 Objectives

- Apply Clean Architecture principles to the domain layer.
- Create and manage product entities.
- Implement core use cases as callable classes.
- Establish a maintainable and testable business logic layer.

---

## 🧱 Domain Layer Features

### ✅ Entity: `Product`
A single product in the eCommerce platform containing the following attributes:
- `id` (String)
- `name` (String)
- `description` (String)
- `imageUrl` (String)
- `price` (double)

### ✅ Use Cases (Callable Classes)

| Use Case                 |         Description  ----------------------------------------------------------------------------|
| `ViewAllProductsUsecase` | Retrieves a list of all davailableproducts.  
| `ViewProductUsecase`     | Fetches a specific product by ID.   
| `CreateProductUsecase`   | Accepts a new `Product` object and adds it to the product list. |
| `UpdateProductUsecase`   | Updates the details of an existing product.  
| `DeleteProductUsecase`   | Deletes a product by its ID. 

                                               

All use cases follow the callable class convention and extend from a common `UseCase` base class (based on course material).

---

## 🧠 Architecture

This project follows **Clean Architecture** principles:

```
lib
┣ 📂domain
┃ ┣ 📂entities
┃ ┃ ┗ 📜product.dart
┃ ┣ 📂repositories
┃ ┃ ┗ 📜product_repository.dart
┃ ┗ 📂usecases
┃   ┣ 📜create_product_usecase.dart
┃   ┣ 📜delete_product_usecase.dart
┃   ┣ 📜update_product_usecase.dart
┃   ┣ 📜view_all_products_usecase.dart
┃   ┗ 📜view_product_usecase.dart
```




