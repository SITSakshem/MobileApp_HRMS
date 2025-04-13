// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_comp_off_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableCompOffResponse _$AvailableCompOffResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableCompOffResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: (json['returnId'] as List<dynamic>)
          .map((e) => AvailableCompOff.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AvailableCompOffResponseToJson(
        AvailableCompOffResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

AvailableCompOff _$AvailableCompOffFromJson(Map<String, dynamic> json) =>
    AvailableCompOff(
      empId: (json['empId'] as num).toInt(),
      attendanceDt: json['attendanceDt'] as String,
      inTime: json['_InTime'] as String,
      outTime: json['_OutTime'] as String,
    );

Map<String, dynamic> _$AvailableCompOffToJson(AvailableCompOff instance) =>
    <String, dynamic>{
      'empId': instance.empId,
      'attendanceDt': instance.attendanceDt,
      '_InTime': instance.inTime,
      '_OutTime': instance.outTime,
    };
