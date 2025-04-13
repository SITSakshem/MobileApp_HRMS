// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      (json['messageType'] as num).toInt(),
      json['error'] as String? ?? "",
      json['message'] as String,
      json['returnId'] == null
          ? null
          : Login.fromJson(json['returnId'] as Map<String, dynamic>),
      json['token'] as String?  ?? "",
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      empId: (json['empId'] as num).toInt(),
      userId: json['userId'] as String,
      companyId: (json['companyId'] as num).toInt(),
      orgId: (json['orgId'] as num).toInt(),
      userName: json['userName'] as String,
      orgCode: json['orgCode'] as String,
      userRole: json['userRole'] as String,
      salt: json['salt'] as String,
      token: json['token'] as String? ?? "",
      empDetails:
          EmpDetails.fromJson(json['empDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'empId': instance.empId,
      'userId': instance.userId,
      'companyId': instance.companyId,
      'orgId': instance.orgId,
      'userName': instance.userName,
      'orgCode': instance.orgCode,
      'userRole': instance.userRole,
      'salt': instance.salt,
      'token': instance.token,
      'empDetails': instance.empDetails,
    };

EmpDetails _$EmpDetailsFromJson(Map<String, dynamic> json) => EmpDetails(
      basicDetails:
          BasicDetails.fromJson(json['basicDetails'] as Map<String, dynamic>),
      attendanceSetting: (json['attendanceSetting'] as List<dynamic>)
          .map((e) => AttendanceSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPunchDetails: (json['lastPunchDetails'] as List<dynamic>)
          .map((e) => LastPunchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmpDetailsToJson(EmpDetails instance) =>
    <String, dynamic>{
      'basicDetails': instance.basicDetails,
      'attendanceSetting': instance.attendanceSetting,
      'lastPunchDetails': instance.lastPunchDetails,
    };

BasicDetails _$BasicDetailsFromJson(Map<String, dynamic> json) => BasicDetails(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      title: json['title'] as String,
      empName: json['empName'] as String,
      joiningDt: json['joiningDt'] as String,
      isActive: json['isActive'] as bool,
      officialEmail: json['officialEmail'] as String,
      officialContactNo: json['officialContactNo'] as String? ?? "",
      depId: (json['depId'] as num).toInt(),
      departmentName: json['departmentName'] as String,
      locationId: (json['locationId'] as num).toInt(),
      locationName: json['locationName'] as String,
      subLocationId: (json['subLocationId'] as num).toInt(),
      subLocationName: json['subLocationName'] as String? ?? "",
      zoneId: (json['zoneId'] as num).toInt(),
      zoneName: json['zoneName'] as String,
      companyId: (json['companyId'] as num).toInt(),
      companyName: json['companyName'] as String? ?? "",
      orgId: (json['orgId'] as num).toInt(),
      desId: (json['desId'] as num).toInt(),
      desName: json['desName'] as String,
      cardNo: json['cardNo'] as String? ?? "",
    );

Map<String, dynamic> _$BasicDetailsToJson(BasicDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'empName': instance.empName,
      'joiningDt': instance.joiningDt,
      'isActive': instance.isActive,
      'officialEmail': instance.officialEmail,
      'officialContactNo': instance.officialContactNo,
      'depId': instance.depId,
      'departmentName': instance.departmentName,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'subLocationId': instance.subLocationId,
      'subLocationName': instance.subLocationName,
      'zoneId': instance.zoneId,
      'zoneName': instance.zoneName,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'orgId': instance.orgId,
      'desId': instance.desId,
      'desName': instance.desName,
      'cardNo': instance.cardNo,
    };

AttendanceSetting _$AttendanceSettingFromJson(Map<String, dynamic> json) =>
    AttendanceSetting(
      logId: (json['logId'] as num).toInt(),
      changeType: (json['changeType'] as num).toInt(),
      requestedDt: json['requestedDt'] as String,
      requestedBy: json['requestedBy'] as String? ?? "",
      requestedRemarks: json['requestedRemarks'] as String,
      approvalDt: json['approvalDt'] as String? ?? "",
      approvalBy: json['approvalBy'] as String? ?? "",
      approvalRemarks: json['approvalRemarks'] as String,
      approvalStatus: (json['approvalStatus'] as num).toInt(),
      entityType: (json['entityType'] as num).toInt(),
      empAttendanceId: (json['empAttendanceId'] as num).toInt(),
      empId: (json['empId'] as num).toInt(),
      empName: json['empName'] as String,
      companyId: (json['companyId'] as num).toInt(),
      companyName: json['companyName'] as String? ?? "",
      zoneId: (json['zoneId'] as num).toInt(),
      zoneName: json['zoneName'] as String? ?? "",
      locationId: (json['locationId'] as num).toInt(),
      locationName: json['locationName'] as String? ?? "",
      departmentId: (json['departmentId'] as num).toInt(),
      departmentName: json['departmentName'] as String? ?? "",
      punchType: (json['punchType'] as num).toInt(),
      isSandwichApplicable: json['isSandwichApplicable'] as bool,
      isOverTimeApplicable: json['isOverTimeApplicable'] as bool,
      overtimeId: (json['overtimeId'] as num?)?.toInt() ?? 0,
      overtimeName: json['overtimeName'] as String? ?? "",
      isCompoffApplicable: json['isCompoffApplicable'] as bool,
      isRosterApplicable: json['isRosterApplicable'] as bool,
      rosterWeekOff: (json['rosterWeekOff'] as num).toInt(),
      isMobilePunchApplicable: json['isMobilePunchApplicable'] as bool,
      isGraceTimeAllowed: json['isGraceTimeAllowed'] as bool,
      maxGraceTime: json['maxGraceTime'] as String,
      graceTimeCountAllowed: (json['graceTimeCountAllowed'] as num).toInt(),
      shiftId: (json['shiftId'] as num).toInt(),
      shiftName: json['shiftName'] as String? ?? "",
      weekoffId: (json['weekoffId'] as num).toInt(),
      weekoffName: json['weekoffName'] as String? ?? "",
      effectiveFromDt: json['effectiveFromDt'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$AttendanceSettingToJson(AttendanceSetting instance) =>
    <String, dynamic>{
      'logId': instance.logId,
      'changeType': instance.changeType,
      'requestedDt': instance.requestedDt,
      'requestedBy': instance.requestedBy,
      'requestedRemarks': instance.requestedRemarks,
      'approvalDt': instance.approvalDt,
      'approvalBy': instance.approvalBy,
      'approvalRemarks': instance.approvalRemarks,
      'approvalStatus': instance.approvalStatus,
      'entityType': instance.entityType,
      'empAttendanceId': instance.empAttendanceId,
      'empId': instance.empId,
      'empName': instance.empName,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'zoneId': instance.zoneId,
      'zoneName': instance.zoneName,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'departmentId': instance.departmentId,
      'departmentName': instance.departmentName,
      'punchType': instance.punchType,
      'isSandwichApplicable': instance.isSandwichApplicable,
      'isOverTimeApplicable': instance.isOverTimeApplicable,
      'overtimeId': instance.overtimeId,
      'overtimeName': instance.overtimeName,
      'isCompoffApplicable': instance.isCompoffApplicable,
      'isRosterApplicable': instance.isRosterApplicable,
      'rosterWeekOff': instance.rosterWeekOff,
      'isMobilePunchApplicable': instance.isMobilePunchApplicable,
      'isGraceTimeAllowed': instance.isGraceTimeAllowed,
      'maxGraceTime': instance.maxGraceTime,
      'graceTimeCountAllowed': instance.graceTimeCountAllowed,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
      'weekoffId': instance.weekoffId,
      'weekoffName': instance.weekoffName,
      'effectiveFromDt': instance.effectiveFromDt,
      'isActive': instance.isActive,
    };

LastPunchDetail _$LastPunchDetailFromJson(Map<String, dynamic> json) =>
    LastPunchDetail(
      punchTime: json['punchTime'] as String,
    );

Map<String, dynamic> _$LastPunchDetailToJson(LastPunchDetail instance) =>
    <String, dynamic>{
      'punchTime': instance.punchTime,
    };
