import '../../errors/global_errors.dart';

abstract class ApiRemoteStorage {
  Future<ClientResponse> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });

  Future<ClientResponse> post({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  });

  Future<ClientResponse> delete({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  });

  Future<ClientResponse> patch({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  });

  Future<ClientResponse> put({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  });
}

class ApiHeader {
  final Map<String, dynamic> data;
  const ApiHeader({
    required this.data,
  });
}

class ClientResponse {
  final dynamic data;
  final int statusCode;

  const ClientResponse({
    required this.data,
    required this.statusCode,
  });

  @override
  String toString() => 'ClientResponse(data: $data, statusCode: $statusCode)';
}

class HttpServiceError extends Failure {
  final String message;
  final StackTrace? stackTrace;
  HttpServiceError({required this.message, this.stackTrace});
}
