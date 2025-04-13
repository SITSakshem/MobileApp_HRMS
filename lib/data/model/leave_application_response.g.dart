// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_application_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveApplicationResponse _$LeaveApplicationResponseFromJson(
        Map<String, dynamic> json) =>
    LeaveApplicationResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: (json['returnId'] as List<dynamic>)
          .map((e) => LeaveApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LeaveApplicationResponseToJson(
        LeaveApplicationResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

LeaveApplication _$LeaveApplicationFromJson(Map<String, dynamic> json) =>
    LeaveApplication(
      fromDt: json['fromDt'] as String,
      toDt: json['toDt'] as String,
      leaveType: (json['leaveType'] as num).toInt(),
      applicabilityType: (json['applicabilityType'] as num).toInt(),
      dayPart: (json['dayPart'] as num).toInt(),
      deductedLeave: (json['deductedLeave'] as num).toDouble(),
      requestedBy: json['requestedBy'] as String,
      requestedRemarks: json['requestedRemarks'] as String,
      approvalDt: json['approvalDt'] as String?,
      requestedDt: json['requestedDt'] as String,
      approvalBy: json['approvalBy'] as String?,
      approvalRemarks: json['approvalRemarks'] as String?,
      approvalStatus: (json['approvalStatus'] as num).toInt(),
      isDeleted: json['isDeleted'] as bool,
      deletedDt: json['deletedDt'] as String?,
      deletedBy: json['deletedBy'] as String?,
      deletedRemarks: json['deletedRemarks'] as String,
      document: json['document'] as String?,
      documentfile: json['documentfile'] as String?,
      haveDeleteOption: json['haveDeleteOption'] as bool,
      transactionId: (json['transactionId'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool,
      currentLevel: (json['currentLevel'] as num).toInt(),
      transactionDt: DateTime.parse(json['transactionDt'] as String),
      documentId: (json['documentId'] as num).toInt(),
      transactionNo: (json['transactionNo'] as num).toInt(),
      userId: json['userId'] as String?,
      transactionLog: json['transactionLog'] as String?,
      pendingOnUserId: json['pendingOnUserId'] as String?,
      pendingOnUserName: json['pendingOnUserName'] as String?,
      remarks: json['remarks'] as String,
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
      deptName: json['deptName'] as String,
      desId: json['desId'] as String?,
      desName: json['desName'] as String?,
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$LeaveApplicationToJson(LeaveApplication instance) =>
    <String, dynamic>{
      'fromDt': instance.fromDt,
      'toDt': instance.toDt,
      'leaveType': instance.leaveType,
      'applicabilityType': instance.applicabilityType,
      'dayPart': instance.dayPart,
      'deductedLeave': instance.deductedLeave,
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
      'document': instance.document,
      'documentfile': instance.documentfile,
      'haveDeleteOption': instance.haveDeleteOption,
      'transactionId': instance.transactionId,
      'isCompleted': instance.isCompleted,
      'currentLevel': instance.currentLevel,
      'transactionDt': instance.transactionDt.toIso8601String(),
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
      'isSelected': instance.isSelected,
    };
