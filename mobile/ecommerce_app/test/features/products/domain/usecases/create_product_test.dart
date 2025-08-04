import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/create_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Simulated ProductRepository used for testing with mocktail
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  // Required test variables
  late CreateProductUsecase usecase;
  late MockProductRepository mockRepository;

  // Used as a default fallback input when mocktail needs a Product
  final fallbackProduct = Product(
    id: '0',
    name: '',
    price: 0.0,
    description: '',
    imageUrl: '',
  );

  setUp(() {
    // Setup fresh instances before each test case
    mockRepository = MockProductRepository();
    usecase = CreateProductUsecase(mockRepository);

    // Register default object in case mocktail requires it
    registerFallbackValue(fallbackProduct);
  });

  group('CreateProductUsecase', () {
    test(
      'calls createProduct on the repository and succeeds with a Right when no error occurs',
      () async {
        // Test data setup
        final product = Product(
          id: '1',
          name: 'Test Product',
          price: 10.0,
          description: 'A test product',
          imageUrl: 'http://example.com/test.jpg',
        );

        // Configure mock to return a successful response
        when(
          () => mockRepository.createProduct(product),
        ).thenAnswer((_) async => const Right<Failure, void>(null));

        // Execute the usecase
        await usecase.call(product);

        // Validate that repository method was invoked as expected
        verify(() => mockRepository.createProduct(product)).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test(
      'returns Left with ServerFailure when repository throws an error',
      () async {
        // Input for the test case
        final product = Product(
          id: '2',
          name: 'Invalid Product',
          price: 20.0,
          description: 'An error product',
          imageUrl: 'http://example.com/error.jpg',
        );

        final failure = const ServerFailure('Failed to create product');

        // Configure mock to simulate an error
        when(
          () => mockRepository.createProduct(product),
        ).thenAnswer((_) async => Left(failure));

        // Run the usecase with failing scenario
        final result = await usecase.call(product);

        // Check if failure is returned and interactions are verified
        expect(result, equals(Left(failure)));
        verify(() => mockRepository.createProduct(product)).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
