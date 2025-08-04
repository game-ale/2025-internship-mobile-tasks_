import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/view_all_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Creates a mock version of the ProductRepository for testing purposes.
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ViewAllProductsUsecase usecase;
  late MockProductRepository mockRepository;

  const List<Product> testProducts = [];

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = ViewAllProductsUsecase(mockRepository);

    // Provide a default Product instance as a fallback for mocktail
    registerFallbackValue(
      Product(id: '0', name: '', price: 0.0, description: '', imageUrl: ''),
    );
  });

  group('ViewAllProductsUsecase', () {
    test(
      'invokes getAllProducts from the repository and yields a product list',
      () async {
        // Setup the mock to return a successful result
        when(
          () => mockRepository.getAllProducts(),
        ).thenAnswer((_) async => const Right(testProducts));

        // Run the usecase
        final result = await usecase.call();

        // Confirm that the result matches the expected product list
        expect(result, equals(const Right(testProducts)));
        verify(() => mockRepository.getAllProducts()).called(1);
      },
    );

    test('returns a Failure if the repository encounters an error', () async {
      // Setup the mock to return a failure
      final failure = const ServerFailure('Failed to fetch products');
      when(
        () => mockRepository.getAllProducts(),
      ).thenAnswer((_) async => Left(failure));

      // Run the usecase
      final result = await usecase.call();

      // Ensure the result is a failure and the method was called once
      expect(result, equals(Left(failure)));
      verify(() => mockRepository.getAllProducts()).called(1);
    });
  });
}
