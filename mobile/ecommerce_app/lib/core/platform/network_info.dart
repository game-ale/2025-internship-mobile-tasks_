import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

import '../error/exceptions.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;
  NetworkInfoImpl(this.dataConnectionChecker);
  @override
  Future<bool> get isConnected async {
    final isConnected = await dataConnectionChecker.hasConnection;
    if (!isConnected) {
      throw NetworkException();

    }
    return  isConnected;
  }
}
