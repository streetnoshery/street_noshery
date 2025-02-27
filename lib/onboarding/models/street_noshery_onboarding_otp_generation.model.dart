class StreetNosheryOnboardingOtpGeneration {
  final String state;
  final int status;
  final String data;

  StreetNosheryOnboardingOtpGeneration({
    required this.state,
    required this.status,
    required this.data,
  });

  factory StreetNosheryOnboardingOtpGeneration.fromJson(Map<String, dynamic> json) {
    return StreetNosheryOnboardingOtpGeneration(
      state: json['state'] as String,
      status: json['status'] as int,
      data: json['data'] as String,
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