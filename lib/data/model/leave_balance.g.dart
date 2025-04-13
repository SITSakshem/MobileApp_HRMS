// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveBalanceResponse _$LeaveBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    LeaveBalanceResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: (json['returnId'] as List<dynamic>)
          .map((e) => LeaveBalance.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LeaveBalanceResponseToJson(
        LeaveBalanceResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

LeaveBalance _$LeaveBalanceFromJson(Map<String, dynamic> json) => LeaveBalance(
      empId: (json['empId'] as num).toInt(),
      leaveType: (json['leaveType'] as num).toInt(),
      leaveTypeName: json['leaveTypeName'] as String,
      empName: json['empName'] as String,
      freezeBalance: (json['freezeBalance'] as num).toDouble(),
      leaveBalance: (json['leaveBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$LeaveBalanceToJson(LeaveBalance instance) =>
    <String, dynamic>{
      'empId': instance.empId,
      'leaveType': instance.leaveType,
      'leaveTypeName': instance.leaveTypeName,
      'empName': instance.empName,
      'freezeBalance': instance.freezeBalance,
      'leaveBalance': instance.leaveBalance,
    };
