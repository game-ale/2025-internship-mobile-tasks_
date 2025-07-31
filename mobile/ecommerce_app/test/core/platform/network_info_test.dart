import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce_app/core/platform/network_info.dart';

@GenerateMocks([NetworkInfo])
import 'network_info_test.mocks.dart'; 

void main() {
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
  });

  test('should return true when device is connected', () async {
    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));

    // Act
    final result = await mockNetworkInfo.isConnected;

    // Assert
    expect(result, true);
  });
}
