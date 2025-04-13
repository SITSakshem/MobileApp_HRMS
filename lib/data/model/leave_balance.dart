
import 'package:json_annotation/json_annotation.dart';
part 'leave_balance.g.dart';

@JsonSerializable()
class LeaveBalanceResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  List<LeaveBalance> data;
  String? token;

  LeaveBalanceResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static LeaveBalanceResponse fromJson(Map<String, dynamic> json) => _$LeaveBalanceResponseFromJson(json);

}

@JsonSerializable()
class LeaveBalance {
  int empId;
  int leaveType;
  String leaveTypeName;
  String empName;
  double freezeBalance;
  double leaveBalance;

  LeaveBalance({
    required this.empId,
    required this.leaveType,
    required this.leaveTypeName,
    required this.empName,
    required this.freezeBalance,
    required this.leaveBalance,
  });

  static LeaveBalance fromJson(Map<String, dynamic> json) => _$LeaveBalanceFromJson(json);

}
