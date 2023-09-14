// this class will render the respinse from our cloud server
// its format is Response: {code: 0, message: User account not found., data: null}
//
class AppResponse {
  final int code;
  final String message;
  final dynamic data;

  AppResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AppResponse.fromJson(Map<String, dynamic> json) {
    return AppResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }

  // is successful if code is 1
  bool get isSuccessful => code == 1;

  // is unsuccessful if code is 0 else if 1 its unsuccessful
  bool get isUnsuccessful => code == 0;

  @override
  String toString() =>
      'SttsAppResponse(code: $code, message: $message, data: $data)';
}
