import 'package:dio/dio.dart';

class ApiException implements Exception {
  final int code;
  final String message;
  final String error;
  final String description;

  const ApiException({
    required this.code,
    required this.message,
    this.error = '',
    this.description = '',
  });

  factory ApiException.fromDioError(DioException dioError) {
    final responseData = dioError.response?.data;

    return ApiException(
      code: dioError.response?.statusCode ?? 500,
      message: _extractMessage(dioError),
      error: responseData?['error']?.toString() ?? '',
      description: responseData?['description']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'code': code,
    'message': message,
    'error': error,
    'description': description,
  };

  ApiException copyWith({
    int? code,
    String? message,
    String? error,
    String? description,
  }) {
    return ApiException(
      code: code ?? this.code,
      message: message ?? this.message,
      error: error ?? this.error,
      description: description ?? this.description,
    );
  }

  static String _extractMessage(DioException dioError) {
    final responseData = dioError.response?.data;
    if (responseData is Map<String, dynamic>) {
      return responseData['message']?.toString() ??
          dioError.message ??
          'Unknown error';
    }
    return dioError.message ?? 'Unknown error';
  }

  @override
  String toString() {
    return 'ApiException(code: $code, message: $message, error: $error, description: $description)';
  }
}
