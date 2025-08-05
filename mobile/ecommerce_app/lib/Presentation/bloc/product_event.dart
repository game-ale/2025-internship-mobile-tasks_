part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadAllProductEvent extends ProductEvent {
  const LoadAllProductEvent();

  @override
  List<Object> get props => [];
}

class GetSingleProductEvent extends ProductEvent {
  final String productId;

  const GetSingleProductEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class UpdateProductEvent extends ProductEvent {
  final String productId;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  const UpdateProductEvent({
    required this.productId,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
  @override
  List<Object> get props => [productId, name, price, description, imageUrl];
}

class DeleteProductEvent extends ProductEvent {
  final String productId;
  const DeleteProductEvent ({required this.productId});
  @override
  List<Object> get props => [productId];
}

class CreateProductEvent extends ProductEvent {
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  const CreateProductEvent({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
  @override
  List<Object> get props =>[name,price,description,imageUrl];
}
