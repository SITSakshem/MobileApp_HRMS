import 'package:json_annotation/json_annotation.dart';
part 'user_validate_response.g.dart';

/// messageType : 1
/// error : null
/// message : "dPxhtvI7lXKfxmNiw7zTNhVG5OrPj%2fS0Kp%2f1A1B4%2fkz3Y%2f7c2KvFjtBIm9pa1lCB"
/// returnId : null
/// token : null

@JsonSerializable()
class ValidateUserResponse {
  final int messageType;
  final String? error;
  final String message;
  final int recordCount;
  final String? returnId;
  final String? token;
  final String? companyName;

  ValidateUserResponse(this.messageType, this.error, this.message, this.recordCount, this.returnId, this.token, this.companyName);

  factory ValidateUserResponse.fromJson(dynamic json) => _$ValidateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateUserResponseToJson(this);

  bool isSuccess() => messageType == 1;
}
