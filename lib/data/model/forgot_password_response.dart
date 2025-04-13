import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_response.g.dart';

/// messageType : 1
/// error : null
/// message : "dPxhtvI7lXKfxmNiw7zTNhVG5OrPj%2fS0Kp%2f1A1B4%2fkz3Y%2f7c2KvFjtBIm9pa1lCB"
/// returnId : null
/// token : null

@JsonSerializable()
class ForgotPasswordResponse {
  final int messageType;
  final String? error;
  final String message;
  final int recordCount;
  final String? returnId;
  final String? token;
  final String? companyName;

  ForgotPasswordResponse(this.messageType, this.error, this.message, this.recordCount, this.returnId, this.token, this.companyName);

  factory ForgotPasswordResponse.fromJson(dynamic json) => _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

  bool isSuccess() => messageType == 1;
}
