class ConfirmPassResponse {
  final String? securityKey;
  final bool isSuccess;
  final String? message;

  ConfirmPassResponse({
    this.securityKey,
    required this.isSuccess,
    this.message,
  });

  factory ConfirmPassResponse.fromJson(dynamic json) {
    return ConfirmPassResponse(
      isSuccess: json['isSuccess'],
      securityKey: json['data'] != null ? json['data']['securityKey'] : null,
      message: json['message'],
    );
  }
}
