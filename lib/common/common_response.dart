import 'package:street_noshery/common/common_exception_mapper.dart';

class ApiResponse {
  final String state;
  final int status;
  final dynamic data;

  ApiResponse({required this.state, required this.status, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      state: json['state'],
      status: json['status'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'status': status,
      'data': data,
    };
  }
}

class RepoResponse<T> {
  final ApiException? error;
  final T? data;

  RepoResponse({this.error, this.data});
}