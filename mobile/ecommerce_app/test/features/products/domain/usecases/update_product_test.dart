import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Creates a mock of ProductRepository using mocktail for testing.
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late UpdateProductUsecase usecase;
  late MockProductRepository mockRepository;

  Product testProduct = Product(
    id: '1',
    name: 'Test Product',
    price: 10.0,
    description: 'Test product description',
    imageUrl: 'http://example.com/image.jpg',
  );

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = UpdateProductUsecase(mockRepository);

    // Define a default Product instance to use as a fallback during mocking.
    registerFallbackValue(
      Product(id: '0', name: '', price: 0.0, description: '', imageUrl: ''),
    );
  });

  group('UpdateProductUsecase', () {
    test(
      'invokes repository\'s updateProduct method with the expected Product input',
      () async {
        // Set up the mock to return success when updateProduct is called
        when(
          () => mockRepository.updateProduct(testProduct),
        ).thenAnswer((_) async => const Right<Failure, void>(null));

        // Execute the use case
        final result = await usecase.call(testProduct);

        // Confirm that the result is a successful Right(null) and the method was triggered once
        expect(result, equals(const Right<Failure, void>(null)));
        verify(() => mockRepository.updateProduct(testProduct)).called(1);
      },
    );

    test('returns Failure when the repository throws an error', () async {
      // Set up the mock to return a ServerFailure on method call
      final failure = const ServerFailure('Update failed');
      when(
        () => mockRepository.updateProduct(testProduct),
      ).thenAnswer((_) async => Left(failure));

      // Run the use case
      final result = await usecase.call(testProduct);

      // Validate that a Failure is returned and the method was invoked once
      expect(result, equals(Left(failure)));
      verify(() => mockRepository.updateProduct(testProduct)).called(1);
    });
  });
}
