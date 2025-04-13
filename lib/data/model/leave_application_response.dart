
import 'package:json_annotation/json_annotation.dart';
part 'leave_application_response.g.dart';


@JsonSerializable()
class LeaveApplicationResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  List<LeaveApplication> data;
  String? token;

  LeaveApplicationResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static LeaveApplicationResponse fromJson(Map<String, dynamic> json) => _$LeaveApplicationResponseFromJson(json);

}


@JsonSerializable()
class LeaveApplication {
  String fromDt;
  String toDt;
  int leaveType;
  int applicabilityType;
  int dayPart;
  double deductedLeave;
  String requestedBy;
  String requestedRemarks;
  String? approvalDt;
  String requestedDt;
  String? approvalBy;
  String? approvalRemarks;
  int approvalStatus;
  bool isDeleted;
  String? deletedDt;
  String? deletedBy;
  String deletedRemarks;
  String? document;
  String? documentfile;
  bool haveDeleteOption;
  int transactionId;
  bool isCompleted;
  int currentLevel;
  DateTime transactionDt;
  int documentId;
  int transactionNo;
  String? userId;
  String? transactionLog;
  String? pendingOnUserId;
  String? pendingOnUserName;
  String remarks;
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
  String deptName;
  String? desId;
  String? desName;
  bool? isSelected;

  LeaveApplication({
    required this.fromDt,
    required this.toDt,
    required this.leaveType,
    required this.applicabilityType,
    required this.dayPart,
    required this.deductedLeave,
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
    required this.document,
    required this.documentfile,
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

  static LeaveApplication fromJson(Map<String, dynamic> json) => _$LeaveApplicationFromJson(json);

}
