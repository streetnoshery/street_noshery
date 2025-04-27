class ApiException implements Exception {
  final String? message;
  final String? errorCode;
  final dynamic errorReason;
  final int? statusCode;

  ApiException({this.message, this.errorCode, this.errorReason, this.statusCode});
}