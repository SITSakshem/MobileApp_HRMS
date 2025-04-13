// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveTypeResponse _$LeaveTypeResponseFromJson(Map<String, dynamic> json) =>
    LeaveTypeResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: json['returnId'] == null
          ? null
          : DataResponse.fromJson(json['returnId'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LeaveTypeResponseToJson(LeaveTypeResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      leaveType: (json['leaveType'] as List<dynamic>)
          .map((e) => LeaveType.fromJson(e as Map<String, dynamic>))
          .toList(),
      applicabilityType: (json['applicabilityType'] as List<dynamic>)
          .map((e) => ApplicabilityType.fromJson(e as Map<String, dynamic>))
          .toList(),
      dayPart: (json['dayPart'] as List<dynamic>)
          .map((e) => DayPart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'leaveType': instance.leaveType,
      'applicabilityType': instance.applicabilityType,
      'dayPart': instance.dayPart,
    };

ApplicabilityType _$ApplicabilityTypeFromJson(Map<String, dynamic> json) =>
    ApplicabilityType(
      applicabilityTypeId: (json['applicabilityTypeId'] as num).toInt(),
      applicabilityTypeName: json['applicabilityTypeName'] as String,
    );

Map<String, dynamic> _$ApplicabilityTypeToJson(ApplicabilityType instance) =>
    <String, dynamic>{
      'applicabilityTypeId': instance.applicabilityTypeId,
      'applicabilityTypeName': instance.applicabilityTypeName,
    };

DayPart _$DayPartFromJson(Map<String, dynamic> json) => DayPart(
      dayPartId: (json['dayPartId'] as num).toInt(),
      dayPartName: json['dayPartName'] as String,
    );

Map<String, dynamic> _$DayPartToJson(DayPart instance) => <String, dynamic>{
      'dayPartId': instance.dayPartId,
      'dayPartName': instance.dayPartName,
    };

LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) => LeaveType(
      leaveTypeId: (json['leaveTypeId'] as num).toInt(),
      leaveTypeName: json['leaveTypeName'] as String,
    );

Map<String, dynamic> _$LeaveTypeToJson(LeaveType instance) => <String, dynamic>{
      'leaveTypeId': instance.leaveTypeId,
      'leaveTypeName': instance.leaveTypeName,
    };
