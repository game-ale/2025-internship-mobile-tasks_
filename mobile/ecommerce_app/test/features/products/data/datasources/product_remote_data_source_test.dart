import 'dart:convert';

import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  const tId = 1;
  const baseUrl = 'https://your.api.com/products';

  final tProductJson = {
    "id": 1,
    "name": "Test Product",
    "description": "A great item",
    "price": 9.99,
    "imageUrl": "https://example.com/image.jpg"
  };

  final tProductModel = ProductModel.fromJson(tProductJson);
  final tProductModelList = [tProductModel];

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getAllProducts', () {
    test('should return List<ProductModel> on 200 OK', () async {
      when(mockHttpClient.get(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
      )).thenAnswer((_) async => http.Response(json.encode([tProductJson]), 200));

      final result = await dataSource.getAllProducts();

      expect(result, equals(tProductModelList));
    });

    test('should throw ServerException on non-200', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => dataSource.getAllProducts(), throwsA(isA<ServerException>()));
    });
  });

  group('getProductById', () {
    test('should return ProductModel on 200 OK', () async {
      when(mockHttpClient.get(
        Uri.parse('$baseUrl/$tId'),
        headers: {'Content-Type': 'application/json'},
      )).thenAnswer((_) async => http.Response(json.encode(tProductJson), 200));

      final result = await dataSource.getProductById(tId);

      expect(result, equals(tProductModel));
    });

    test('should throw ServerException on error', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Error', 500));

      expect(() => dataSource.getProductById(tId), throwsA(isA<ServerException>()));
    });
  });

  group('createProduct', () {
    test('should POST and return void on 201 Created', () async {
      when(mockHttpClient.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(tProductModel.toJson()),
      )).thenAnswer((_) async => http.Response('', 201));

      final result = await dataSource.createProduct(tProductModel);
      expectLater(dataSource.createProduct(tProductModel), completes);

    });

    test('should throw ServerException on non-201', () async {
      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Error', 400));

      expect(() => dataSource.createProduct(tProductModel), throwsA(isA<ServerException>()));
    });
  });

  group('updateProduct', () {
    test('should PUT and return void on 200 OK', () async {
      when(mockHttpClient.put(
        Uri.parse('$baseUrl/${tProductModel.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(tProductModel.toJson()),
      )).thenAnswer((_) async => http.Response('', 200));

      final result = await dataSource.updateProduct(tProductModel);

      expectLater(dataSource.updateProduct(tProductModel), completes);

    
    });

    test('should throw ServerException on non-200', () async {
      when(mockHttpClient.put(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Error', 500));

      expect(() => dataSource.updateProduct(tProductModel), throwsA(isA<ServerException>()));
    });
  });

  group('deleteProduct', () {
    test('should perform DELETE request and return void on 204', () async {
      when(mockHttpClient.delete(Uri.parse('$baseUrl/$tId'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('', 204));

      final result = await dataSource.deleteProduct(tId);
;
    });

    test('should throw ServerException on non-200/204', () async {
      when(mockHttpClient.delete(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Error', 500));

      expect(() => dataSource.deleteProduct(tId), throwsA(isA<ServerException>()));
    });
  });
}
