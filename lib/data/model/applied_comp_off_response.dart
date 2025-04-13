
import 'package:json_annotation/json_annotation.dart';
part 'applied_comp_off_response.g.dart';

@JsonSerializable()
class AppliedCompOffResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  List<AppliedCompOff> data;
  String? token;

  AppliedCompOffResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static AppliedCompOffResponse fromJson(Map<String, dynamic> json) => _$AppliedCompOffResponseFromJson(json);

}

@JsonSerializable()
class AppliedCompOff {
  bool isNightShift;
  String attendanceDt;
  String inTime;
  String outTime;
  String requestedBy;
  String requestedRemarks;
  String approvalDt;
  String requestedDt;
  String approvalBy;
  String approvalRemarks;
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

  AppliedCompOff({
    required this.isNightShift,
    required this.attendanceDt,
    required this.inTime,
    required this.outTime,
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

  static AppliedCompOff fromJson(Map<String, dynamic> json) => _$AppliedCompOffFromJson(json);
}
