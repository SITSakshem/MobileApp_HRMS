// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downline_emp_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownLineEmpResponse _$DownLineEmpResponseFromJson(Map<String, dynamic> json) =>
    DownLineEmpResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: (json['returnId'] as List<dynamic>)
          .map((e) => DownLineEmp.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DownLineEmpResponseToJson(
        DownLineEmpResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

DownLineEmp _$DownLineEmpFromJson(Map<String, dynamic> json) => DownLineEmp(
      downLineEmpId: (json['id'] as num).toInt(),
      downLineEmpCode: json['code'] as String,
      downLineEmpName: json['empName'] as String,
      downLineIsActive: json['isActive'] as bool,
      downLineEmpCompanyId: (json['companyId'] as num).toInt(),
      downLineHrSpocId: (json['hr_spoc_Id'] as num).toInt(),
      managerID: (json['manager_Id'] as num).toInt(),
      downLineEmpDeptID: (json['deptId'] as num).toInt(),
      downLineEmpLocationID: (json['locationId'] as num).toInt(),
      downLineEmpZoneID: (json['zoneId'] as num).toInt(),
      downLineEmpManagerName: json['managerName'] as String?,
      downLineEmpHrSpocName: json['hrSpocName'] as String?,
      downLineEmpDepth: (json['depth'] as num).toInt(),
      downLineEmpRootManager: (json['rootManager'] as num).toInt(),
    );

Map<String, dynamic> _$DownLineEmpToJson(DownLineEmp instance) =>
    <String, dynamic>{
      'id': instance.downLineEmpId,
      'code': instance.downLineEmpCode,
      'empName': instance.downLineEmpName,
      'isActive': instance.downLineIsActive,
      'companyId': instance.downLineEmpCompanyId,
      'hr_spoc_Id': instance.downLineHrSpocId,
      'manager_Id': instance.managerID,
      'deptId': instance.downLineEmpDeptID,
      'locationId': instance.downLineEmpLocationID,
      'zoneId': instance.downLineEmpZoneID,
      'managerName': instance.downLineEmpManagerName,
      'hrSpocName': instance.downLineEmpHrSpocName,
      'depth': instance.downLineEmpDepth,
      'rootManager': instance.downLineEmpRootManager,
    };
