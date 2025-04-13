// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_application_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceApplicationResponse _$AttendanceApplicationResponseFromJson(
        Map<String, dynamic> json) =>
    AttendanceApplicationResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: (json['returnId'] as List<dynamic>)
          .map((e) => AttendanceApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AttendanceApplicationResponseToJson(
        AttendanceApplicationResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

AttendanceApplication _$AttendanceApplicationFromJson(
        Map<String, dynamic> json) =>
    AttendanceApplication(
      isNightShift: json['isNightShift'] as bool,
      attendanceDt: json['attendanceDt'] as String,
      inTime: json['_InTime'] as String,
      outTime: json['_OutTime'] as String,
      shiftId: (json['shiftId'] as num).toInt(),
      shiftName: json['shiftName'] as String,
      shiftInTime: json['_ShiftInTime'] as String,
      shiftOutTime: json['_ShiftOutTime'] as String,
      defaultInTime: json['_DefaultInTime'] as String,
      defaultOutTime: json['_DefaultOutTime'] as String,
      requestedBy: json['requestedBy'] as String,
      requestedRemarks: json['requestedRemarks'] as String?,
      approvalDt: json['approvalDt'] as String?,
      requestedDt: json['requestedDt'] as String,
      approvalBy: json['approvalBy'] as String?,
      approvalRemarks: json['approvalRemarks'] as String?,
      approvalStatus: (json['approvalStatus'] as num).toInt(),
      isDeleted: json['isDeleted'] as bool,
      deletedDt: json['deletedDt'] as String?,
      deletedBy: json['deletedBy'] as String?,
      deletedRemarks: json['deletedRemarks'] as String,
      haveDeleteOption: json['haveDeleteOption'] as bool,
      transactionId: (json['transactionId'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool,
      currentLevel: (json['currentLevel'] as num).toInt(),
      transactionDt: json['transactionDt'] as String,
      documentId: (json['documentId'] as num).toInt(),
      transactionNo: (json['transactionNo'] as num).toInt(),
      userId: json['userId'] as String?,
      transactionLog: json['transactionLog'] as String?,
      pendingOnUserId: json['pendingOnUserId'] as String?,
      pendingOnUserName: json['pendingOnUserName'] as String?,
      remarks: json['remarks'] as String?,
      empId: (json['empId'] as num).toInt(),
      empName: json['empName'] as String,
      empCode: json['empCode'] as String?,
      companyId: (json['companyId'] as num).toInt(),
      companyName: json['companyName'] as String,
      zoneId: (json['zoneId'] as num).toInt(),
      zoneName: json['zoneName'] as String,
      locationId: (json['locationId'] as num).toInt(),
      locationName: json['locationName'] as String,
      deptId: (json['deptId'] as num).toInt(),
      deptName: json['deptName'] as String?,
      desId: json['desId'] as String?,
      desName: json['desName'] as String?,
    );

Map<String, dynamic> _$AttendanceApplicationToJson(
        AttendanceApplication instance) =>
    <String, dynamic>{
      'isNightShift': instance.isNightShift,
      'attendanceDt': instance.attendanceDt,
      '_InTime': instance.inTime,
      '_OutTime': instance.outTime,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
      '_ShiftInTime': instance.shiftInTime,
      '_ShiftOutTime': instance.shiftOutTime,
      '_DefaultInTime': instance.defaultInTime,
      '_DefaultOutTime': instance.defaultOutTime,
      'requestedBy': instance.requestedBy,
      'requestedRemarks': instance.requestedRemarks,
      'approvalDt': instance.approvalDt,
      'requestedDt': instance.requestedDt,
      'approvalBy': instance.approvalBy,
      'approvalRemarks': instance.approvalRemarks,
      'approvalStatus': instance.approvalStatus,
      'isDeleted': instance.isDeleted,
      'deletedDt': instance.deletedDt,
      'deletedBy': instance.deletedBy,
      'deletedRemarks': instance.deletedRemarks,
      'haveDeleteOption': instance.haveDeleteOption,
      'transactionId': instance.transactionId,
      'isCompleted': instance.isCompleted,
      'currentLevel': instance.currentLevel,
      'transactionDt': instance.transactionDt,
      'documentId': instance.documentId,
      'transactionNo': instance.transactionNo,
      'userId': instance.userId,
      'transactionLog': instance.transactionLog,
      'pendingOnUserId': instance.pendingOnUserId,
      'pendingOnUserName': instance.pendingOnUserName,
      'remarks': instance.remarks,
      'empId': instance.empId,
      'empName': instance.empName,
      'empCode': instance.empCode,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'zoneId': instance.zoneId,
      'zoneName': instance.zoneName,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'deptId': instance.deptId,
      'deptName': instance.deptName,
      'desId': instance.desId,
      'desName': instance.desName,
    };
