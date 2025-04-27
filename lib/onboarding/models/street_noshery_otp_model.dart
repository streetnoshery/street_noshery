class StreetNosheryOtpResponse {
  final String data;
  final int status;
  final String state;

  StreetNosheryOtpResponse({
    required this.data,
    required this.status,
    required this.state,
  });

  // Factory method to create an instance from JSON
  factory StreetNosheryOtpResponse.fromJson(Map<String, dynamic> json) {
    return StreetNosheryOtpResponse(
      data: json['data'],
      status: json['status'],
      state: json['state'],
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'status': status,
      'state': state,
    };
  }
}
