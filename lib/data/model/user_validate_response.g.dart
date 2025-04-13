// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_validate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateUserResponse _$ValidateUserResponseFromJson(
        Map<String, dynamic> json) =>
    ValidateUserResponse(
      (json['messageType'] as num).toInt(),
      json['error'] as String?,
      json['message'] as String,
      (json['recordCount'] as num).toInt(),
      json['returnId'] as String?,
      json['token'] as String?,
      json['companyName'] as String?,
    );

Map<String, dynamic> _$ValidateUserResponseToJson(
        ValidateUserResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'recordCount': instance.recordCount,
      'returnId': instance.returnId,
      'token': instance.token,
      'companyName': instance.companyName,
    };
