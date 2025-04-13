// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_comp_off_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedCompOffResponse _$AppliedCompOffResponseFromJson(
        Map<String, dynamic> json) =>
    AppliedCompOffResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: (json['returnId'] as List<dynamic>)
          .map((e) => AppliedCompOff.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AppliedCompOffResponseToJson(
        AppliedCompOffResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

AppliedCompOff _$AppliedCompOffFromJson(Map<String, dynamic> json) =>
    AppliedCompOff(
      isNightShift: json['isNightShift'] as bool,
      attendanceDt: json['attendanceDt'] as String,
      inTime: json['inTime'] as String,
      outTime: json['outTime'] as String,
      requestedBy: json['requestedBy'] as String,
      requestedRemarks: json['requestedRemarks'] as String,
      approvalDt: json['approvalDt'] as String,
      requestedDt: json['requestedDt'] as String,
      approvalBy: json['approvalBy'] as String,
      approvalRemarks: json['approvalRemarks'] as String,
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
    );

Map<String, dynamic> _$AppliedCompOffToJson(AppliedCompOff instance) =>
    <String, dynamic>{
      'isNightShift': instance.isNightShift,
      'attendanceDt': instance.attendanceDt,
      'inTime': instance.inTime,
      'outTime': instance.outTime,
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
