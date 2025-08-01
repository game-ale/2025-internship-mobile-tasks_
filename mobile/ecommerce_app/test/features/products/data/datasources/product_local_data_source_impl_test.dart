import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}
  void main() {
    late ProductLocalDataSourceImpl dataSource;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      dataSource = ProductLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences,
      );
    });

    final tProductModel = ProductModel(
      id: 1,
      name: 'Test Product',
      description: 'Description',
      price: 99.99,
      imageUrl: 'http://example.com/image.png',
    );

    final tProductModelList = [tProductModel];
    final tProductJsonString = json.encode(
      tProductModelList.map((e) => e.toJson()).toList(),
    );

    group('cacheProducts', () {
      test('should call SharedPreferences to cache the data', () async {
        // act
        await dataSource.cacheProducts(tProductModelList);
        // assert
        verify(mockSharedPreferences.setString(any as String, tProductJsonString));
        // null cant assinged to string
      });
    });

    group('getCachedProducts', () {
      test('should return List<Product> when there is data in cache', () async {
        // arrange
        when(
          mockSharedPreferences.getString(any as String),
        ).thenReturn(tProductJsonString);
        // act
        final result = await dataSource.getCachedProducts();
        // assert
        expect(result, equals(tProductModelList));
      });

      test(
        'should throw CacheException when there is no cached data',
        () async {
          // arrange
          when(mockSharedPreferences.getString(any as String)).thenReturn(null);
          // act
          final call = dataSource.getCachedProducts;
          // assert
          expect(() => call(), throwsA(isA<CacheException>()));
        },
      );
    });

    group('clearCache', () {
      test('should call SharedPreferences to remove cached data', () async {
        // act
        await dataSource.clearCache();
        // assert
        verify(mockSharedPreferences.remove(any as String));
      });
    });

    group('getLastProducts', () {
      test(
        'should return the last 1 product (same as cached in this case)',
        () async {
          // arrange
          when(
            mockSharedPreferences.getString(any as String),
          ).thenReturn(tProductJsonString);
          // act
          final result = await dataSource.getLastProducts();
          // assert
          expect(result.length, 1);
          expect(result.first, equals(tProductModel));
        },
      );
    });
  }

