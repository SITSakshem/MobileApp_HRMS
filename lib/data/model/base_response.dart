import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

/// messageType : 1
/// error : null
/// message : "dPxhtvI7lXKfxmNiw7zTNhVG5OrPj%2fS0Kp%2f1A1B4%2fkz3Y%2f7c2KvFjtBIm9pa1lCB"
/// returnId : null
/// token : null

@JsonSerializable()
class BaseResponse {
  final int messageType;
  final String? error;
  final String message;
  @JsonKey(name: "returnId")
  final dynamic data;
  final String? token;

  BaseResponse(this.messageType, this.error, this.message, this.data, this.token);

  factory BaseResponse.fromJson(dynamic json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  bool isSuccess() => messageType == 1;
}
