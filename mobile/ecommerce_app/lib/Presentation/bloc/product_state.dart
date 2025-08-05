part of 'product_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class InitialState extends ProductsState {}

class LoadingState extends ProductsState {
  const LoadingState();
}

class LoadedAllProductsState extends ProductsState {
  final List<Product> products;

  const LoadedAllProductsState(this.products);

  @override
  List<Object> get props => [products];
}

class LoadedSingleProductsState extends ProductsState {
  final Product product;

  const LoadedSingleProductsState(this.product);
  @override
  List<Object> get props => [product];
}

class ErrorState extends ProductsState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class UpdatedProductState extends ProductsState {
  const UpdatedProductState();

  @override
  List<Object> get props => [];
}

class CreatedProductState extends ProductsState {
  const CreatedProductState();

  @override
  List<Object> get props => [];
}

class DeletedProductState extends ProductsState {
  const DeletedProductState();

  @override
  List<Object> get props => [];
}
