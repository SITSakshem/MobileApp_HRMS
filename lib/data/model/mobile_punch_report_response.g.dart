// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_punch_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobilePunchReportResponse _$MobilePunchReportResponseFromJson(
        Map<String, dynamic> json) =>
    MobilePunchReportResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: (json['returnId'] as List<dynamic>)
          .map((e) => MobilePunchReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$MobilePunchReportResponseToJson(
        MobilePunchReportResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

MobilePunchReport _$MobilePunchReportFromJson(Map<String, dynamic> json) =>
    MobilePunchReport(
      attendanceDt: json['attendanceDt'] as String,
      companyName: json['companyName'] as String,
      companyId: (json['companyId'] as num?)?.toInt(),
      zoneName: json['zoneName'] as String?,
      zoneId: (json['zoneId'] as num?)?.toInt(),
      locationName: json['locationName'] as String?,
      locationId: (json['locationId'] as num?)?.toInt(),
      deptName: json['deptName'] as String?,
      deptId: (json['deptId'] as num?)?.toInt(),
      empName: json['empName'] as String?,
      empId: (json['empId'] as num?)?.toInt(),
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      locationAddress: json['locationAddress'] as String?,
      punchType: (json['punchType'] as num?)?.toInt(),
      punchTime: json['punchTime'] as String?,
      punchTypeName: json['punchTypeName'] as String?,
      attachement: json['attachement'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MobilePunchReportToJson(MobilePunchReport instance) =>
    <String, dynamic>{
      'attendanceDt': instance.attendanceDt,
      'companyName': instance.companyName,
      'companyId': instance.companyId,
      'zoneName': instance.zoneName,
      'zoneId': instance.zoneId,
      'locationName': instance.locationName,
      'locationId': instance.locationId,
      'deptName': instance.deptName,
      'deptId': instance.deptId,
      'empName': instance.empName,
      'empId': instance.empId,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'locationAddress': instance.locationAddress,
      'punchType': instance.punchType,
      'punchTime': instance.punchTime,
      'punchTypeName': instance.punchTypeName,
      'attachement': instance.attachement,
      'description': instance.description,
    };
