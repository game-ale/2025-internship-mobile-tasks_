import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../features/products/domain/entities/product.dart';

import '../../features/products/domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductsState> {
  final ProductRepository productRepository;

  ProductsBloc({required this.productRepository}) : super(InitialState()) {
 
    on<LoadAllProductEvent>(_onLoadAllProducts);
    on<GetSingleProductEvent>(_onGetSingleProduct);
    on<UpdateProductEvent>(_onUpdateProduct);
    on<CreateProductEvent>(_onCreateProduct);
    on<DeleteProductEvent>(_onDeleteProduct);
  }

 

  void _onLoadAllProducts(
    LoadAllProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(LoadingState());
    final result = await productRepository.getAllProducts();
    result.fold(
      (failure) => emit(ErrorState(failure.toString())),
      (products) => emit(LoadedAllProductsState(products)),
    );
  }

  void _onGetSingleProduct(
    GetSingleProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
   

    final result = await productRepository.getProductById(event.productId);
    result.fold(
      (failure) => emit(ErrorState(failure.toString())),
      (product) => emit(LoadedSingleProductsState(product)),
    );
  }

  void _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final result = await productRepository.updateProduct(
      Product(
        id: event.productId,
        description: event.description,
        imageUrl: event.imageUrl,
        name: event.name,
        price: event.price,
      ),
    );
    result.fold(
      (failure) => emit(ErrorState(failure.toString())),
      (_) => emit(const UpdatedProductState()),
    );
  }

  void _onCreateProduct(
    CreateProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    // Assuming you have a ProductParams or similar as discussed previously
    final result = await productRepository.createProduct(
      ProductParams(
        description: event.description,
        imageUrl: event.imageUrl,
        name: event.name,
        price: event.price,
      ),
    );
    result.fold(
      (failure) => emit(ErrorState(failure.toString())),
      (_) => emit(const CreatedProductState()),
    );
  }

  void _onDeleteProduct(
    DeleteProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final result = await productRepository.deleteProduct(event.productId);
    result.fold(
      (failure) => emit(ErrorState(failure.toString())),
      (_) => emit(const DeletedProductState()),
    );
  }
}