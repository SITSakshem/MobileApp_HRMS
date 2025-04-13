
import 'package:json_annotation/json_annotation.dart';

part 'attendance_application_response.g.dart';


@JsonSerializable()
class AttendanceApplicationResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  List<AttendanceApplication> data;
  String? token;

  AttendanceApplicationResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static AttendanceApplicationResponse fromJson(Map<String, dynamic> json) => _$AttendanceApplicationResponseFromJson(json);

}

@JsonSerializable()
class AttendanceApplication {
  bool isNightShift;
  String attendanceDt;
  @JsonKey(name:  "_InTime")
  String inTime;
  @JsonKey(name:  "_OutTime")
  String outTime;
  int shiftId;
  String shiftName;
  @JsonKey(name:  "_ShiftInTime")
  String shiftInTime;
  @JsonKey(name:  "_ShiftOutTime")
  String shiftOutTime;
  @JsonKey(name:  "_DefaultInTime")
  String defaultInTime;
  @JsonKey(name:  "_DefaultOutTime")
  String defaultOutTime;
  String requestedBy;
  String? requestedRemarks;
  String? approvalDt;
  String requestedDt;
  String? approvalBy;
  String? approvalRemarks;
  int approvalStatus;
  bool isDeleted;
  String? deletedDt;
  String? deletedBy;
  String deletedRemarks;
  bool haveDeleteOption;
  int transactionId;
  bool isCompleted;
  int currentLevel;
  String transactionDt;
  int documentId;
  int transactionNo;
  String? userId;
  String? transactionLog;
  String? pendingOnUserId;
  String? pendingOnUserName;
  String? remarks;
  int empId;
  String empName;
  String? empCode;
  int companyId;
  String companyName;
  int zoneId;
  String zoneName;
  int locationId;
  String locationName;
  int deptId;
  String? deptName;
  String? desId;
  String? desName;

  AttendanceApplication({
    required this.isNightShift,
    required this.attendanceDt,
    required this.inTime,
    required this.outTime,
    required this.shiftId,
    required this.shiftName,
    required this.shiftInTime,
    required this.shiftOutTime,
    required this.defaultInTime,
    required this.defaultOutTime,
    required this.requestedBy,
    required this.requestedRemarks,
    required this.approvalDt,
    required this.requestedDt,
    required this.approvalBy,
    required this.approvalRemarks,
    required this.approvalStatus,
    required this.isDeleted,
    required this.deletedDt,
    required this.deletedBy,
    required this.deletedRemarks,
    required this.haveDeleteOption,
    required this.transactionId,
    required this.isCompleted,
    required this.currentLevel,
    required this.transactionDt,
    required this.documentId,
    required this.transactionNo,
    required this.userId,
    required this.transactionLog,
    required this.pendingOnUserId,
    required this.pendingOnUserName,
    required this.remarks,
    required this.empId,
    required this.empName,
    required this.empCode,
    required this.companyId,
    required this.companyName,
    required this.zoneId,
    required this.zoneName,
    required this.locationId,
    required this.locationName,
    required this.deptId,
    required this.deptName,
    required this.desId,
    required this.desName,
  });

  static AttendanceApplication fromJson(Map<String, dynamic> json) => _$AttendanceApplicationFromJson(json);

}
