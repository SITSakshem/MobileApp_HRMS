import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse {
  final int messageType;
  final String? error;
  final String message;
  @JsonKey(name: "returnId")
  Login? data;
  final String? token;

  LoginResponse(this.messageType, this.error, this.message, this.data, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  bool isSuccess() {
    return messageType == 1 && data != null;
  }
}

@JsonSerializable()
class Login {
  int empId;
  String userId;
  int companyId;
  int orgId;
  String userName;
  String orgCode;
  String userRole;
  String salt;
  String? token;
  EmpDetails empDetails;

  Login({
    required this.empId,
    required this.userId,
    required this.companyId,
    required this.orgId,
    required this.userName,
    required this.orgCode,
    required this.userRole,
    required this.salt,
    required this.token,
    required this.empDetails,
  });

  static Login fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

}

@JsonSerializable()
class EmpDetails {
  BasicDetails basicDetails;
  List<AttendanceSetting> attendanceSetting;
  List<LastPunchDetail> lastPunchDetails;

  EmpDetails({
    required this.basicDetails,
    required this.attendanceSetting,
    required this.lastPunchDetails,
  });

  static EmpDetails fromJson(Map<String, dynamic> json) => _$EmpDetailsFromJson(json);

}

@JsonSerializable()
class BasicDetails {
  int id;
  String code;
  String title;
  String empName;
  String joiningDt;
  bool isActive;
  String officialEmail;
  String? officialContactNo;
  int depId;
  String departmentName;
  int locationId;
  String locationName;
  int subLocationId;
  String? subLocationName;
  int zoneId;
  String zoneName;
  int companyId;
  String? companyName;
  int orgId;
  int desId;
  String desName;
  String? cardNo;

  BasicDetails({
    required this.id,
    required this.code,
    required this.title,
    required this.empName,
    required this.joiningDt,
    required this.isActive,
    required this.officialEmail,
    required this.officialContactNo,
    required this.depId,
    required this.departmentName,
    required this.locationId,
    required this.locationName,
    required this.subLocationId,
    required this.subLocationName,
    required this.zoneId,
    required this.zoneName,
    required this.companyId,
    required this.companyName,
    required this.orgId,
    required this.desId,
    required this.desName,
    required this.cardNo,
  });

  static BasicDetails fromJson(Map<String, dynamic> json) => _$BasicDetailsFromJson(json);

}

@JsonSerializable()
class AttendanceSetting {
  int logId;
  int changeType;
  String requestedDt;
  String? requestedBy;
  String requestedRemarks;
  String? approvalDt;
  String? approvalBy;
  String approvalRemarks;
  int approvalStatus;
  int entityType;
  int empAttendanceId;
  int empId;
  String empName;
  int companyId;
  String? companyName;
  int zoneId;
  String? zoneName;
  int locationId;
  String? locationName;
  int departmentId;
  String? departmentName;
  int punchType;
  bool isSandwichApplicable;
  bool isOverTimeApplicable;
  int? overtimeId;
  String? overtimeName;
  bool isCompoffApplicable;
  bool isRosterApplicable;
  int rosterWeekOff;
  bool isMobilePunchApplicable;
  bool isGraceTimeAllowed;
  String maxGraceTime;
  int graceTimeCountAllowed;
  int shiftId;
  String? shiftName;
  int weekoffId;
  String? weekoffName;
  String effectiveFromDt;
  bool isActive;

  AttendanceSetting({
    required this.logId,
    required this.changeType,
    required this.requestedDt,
    required this.requestedBy,
    required this.requestedRemarks,
    required this.approvalDt,
    required this.approvalBy,
    required this.approvalRemarks,
    required this.approvalStatus,
    required this.entityType,
    required this.empAttendanceId,
    required this.empId,
    required this.empName,
    required this.companyId,
    required this.companyName,
    required this.zoneId,
    required this.zoneName,
    required this.locationId,
    required this.locationName,
    required this.departmentId,
    required this.departmentName,
    required this.punchType,
    required this.isSandwichApplicable,
    required this.isOverTimeApplicable,
    required this.overtimeId,
    required this.overtimeName,
    required this.isCompoffApplicable,
    required this.isRosterApplicable,
    required this.rosterWeekOff,
    required this.isMobilePunchApplicable,
    required this.isGraceTimeAllowed,
    required this.maxGraceTime,
    required this.graceTimeCountAllowed,
    required this.shiftId,
    required this.shiftName,
    required this.weekoffId,
    required this.weekoffName,
    required this.effectiveFromDt,
    required this.isActive,
  });

  static AttendanceSetting fromJson(Map<String, dynamic> json) => _$AttendanceSettingFromJson(json);
}

@JsonSerializable()
class LastPunchDetail {
  String punchTime;

  LastPunchDetail({
    required this.punchTime,
  });

  static LastPunchDetail fromJson(Map<String, dynamic> json) => _$LastPunchDetailFromJson(json);

}
