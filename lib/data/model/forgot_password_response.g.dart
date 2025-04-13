// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      (json['messageType'] as num).toInt(),
      json['error'] as String?,
      json['message'] as String,
      (json['recordCount'] as num).toInt(),
      json['returnId'] as String?,
      json['token'] as String?,
      json['companyName'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'recordCount': instance.recordCount,
      'returnId': instance.returnId,
      'token': instance.token,
      'companyName': instance.companyName,
    };
