import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/product/domain/usecases/delete_product.dart';

// Step 1: Create a mock
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late DeleteProductUseCase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = DeleteProductUseCase(productRepository: mockRepository);
  });

  const tProductId = '123';

  test('should delete product and return true on success', () async {
    // Arrange
    when(() => mockRepository.deleteProduct(tProductId))
        .thenAnswer((_) async => const Right(true));

    // Act
    final result = await usecase.execute(tProductId);

    // Assert
    expect(result, const Right(true));
    verify(() => mockRepository.deleteProduct(tProductId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when delete fails', () async {
    // Arrange
    when(() => mockRepository.deleteProduct(tProductId))
        .thenAnswer((_) async => Left(ServerFailure('Something went wrong')));


    // Act
    final result = await usecase.execute(tProductId);

    // Assert
    expect(result, Left(ServerFailure('Something went wrong')));
    verify(() => mockRepository.deleteProduct(tProductId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
