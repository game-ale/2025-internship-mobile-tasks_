import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// A mock class for ProductRepository created using the mocktail package
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late DeleteProductUsecase usecase;
  late MockProductRepository mockRepository;

  // A sample product instance used for testing scenarios
  Product testProduct = Product(
    id: '1',
    name: 'Test Product',
    price: 10.0,
    description: 'A test product',
    imageUrl: 'https://example.com/test.jpg',
  );

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = DeleteProductUsecase(mockRepository);

    // Provide a default fallback value for product ID if required during mocking
    registerFallbackValue(0);
  });

  group('DeleteProductUsecase', () {
    test(
      'should invoke deleteProduct on the repository using the provided product ID',
      () async {
        // Setup: define the expected behavior of the mock
        when(
          () => mockRepository.deleteProduct(testProduct.id),
        ).thenAnswer((_) async => const Right<Failure, void>(null));

        // Execute the use case
        final result = await usecase.call(testProduct.id);

        // Verify that the expected result is returned and method was called once
        expect(result, equals(const Right<Failure, void>(null)));
        verify(() => mockRepository.deleteProduct(testProduct.id)).called(1);
      },
    );

    test('should return a Failure if the repository operation fails', () async {
      // Setup: simulate a failure response from the mock
      final failure = const ServerFailure('Deletion failed');
      when(
        () => mockRepository.deleteProduct(testProduct.id),
      ).thenAnswer((_) async => Left(failure));

      // Execute the use case
      final result = await usecase.call(testProduct.id);

      // Check that the failure is returned and the method was invoked
      expect(result, equals(Left(failure)));
      verify(() => mockRepository.deleteProduct(testProduct.id)).called(1);
    });
  });
}
