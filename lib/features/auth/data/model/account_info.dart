class AccountInfo {
  final String? token;
  final String? securityKey;
  final bool isSuccess;
  final String? message;

  AccountInfo({
    this.token,
    this.securityKey,
    required this.isSuccess,
    this.message,
  });

  factory AccountInfo.fromJson(dynamic json) {
    final data = json['data'];

    return AccountInfo(
      token: data['token'],
      securityKey: data['securityKey'],
      message: json['message'],
      isSuccess: json['isSuccess'],
    );
  }
}
