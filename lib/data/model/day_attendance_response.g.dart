// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayAttendanceResponse _$DayAttendanceResponseFromJson(
        Map<String, dynamic> json) =>
    DayAttendanceResponse(
      messageType: (json['messageType'] as num).toInt(),
      error: json['error'] as String?,
      message: json['message'] as String,
      data: json['returnId'] == null
          ? null
          : DayAttendance.fromJson(json['returnId'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DayAttendanceResponseToJson(
        DayAttendanceResponse instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'error': instance.error,
      'message': instance.message,
      'returnId': instance.data,
      'token': instance.token,
    };

DayAttendance _$DayAttendanceFromJson(Map<String, dynamic> json) =>
    DayAttendance(
      attendance: (json['attendance'] as List<dynamic>)
          .map((e) => Attendance.fromJson(e as Map<String, dynamic>))
          .toList(),
      attendanceSummary: AttendanceSummary.fromJson(
          json['attendanceSummary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayAttendanceToJson(DayAttendance instance) =>
    <String, dynamic>{
      'attendance': instance.attendance,
      'attendanceSummary': instance.attendanceSummary,
    };

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      isHoliday: json['isHoliday'] as bool,
      isWeekoff: json['isWeekoff'] as bool,
      isLeaveApplied: json['isLeaveApplied'] as bool,
      isPaidLeave: json['isPaidLeave'] as bool,
      leaveType: (json['leaveType'] as num).toInt(),
      applicabilityType: (json['applicabilityType'] as num).toInt(),
      isSandwichApplied: json['isSandwichApplied'] as bool,
      isLateIn: json['isLateIn'] as bool,
      isGraceApplied: json['isGraceApplied'] as bool,
      isOtApplied: json['isOtApplied'] as bool,
      isOutdoorApplied: json['isOutdoorApplied'] as bool,
      isMobilepunchApplied: json['isMobilepunchApplied'] as bool,
      isManualPunchApplied: json['isManualPunchApplied'] as bool,
      isRegularizeApplied: json['isRegularizeApplied'] as bool,
      shiftId: (json['shiftId'] as num).toInt(),
      shiftInTime: json['shift_InTime'] as String,
      shiftOutTime: json['shift_OutTime'] as String,
      isNightShift: json['isNightShift'] as bool,
      attendanceDt: json['attendanceDt'] as String,
      inTime: json['_InTime'] as String,
      outTime: json['_OutTime'] as String,
      empId: (json['empId'] as num).toInt(),
      paidStatus: (json['paidStatus'] as num).toInt(),
      dayStatus: (json['dayStatus'] as num).toInt(),
      paidStatusName: json['paidStatusName'] as String,
      dayStatusName: json['dayStatusName'] as String,
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'isHoliday': instance.isHoliday,
      'isWeekoff': instance.isWeekoff,
      'isLeaveApplied': instance.isLeaveApplied,
      'isPaidLeave': instance.isPaidLeave,
      'leaveType': instance.leaveType,
      'applicabilityType': instance.applicabilityType,
      'isSandwichApplied': instance.isSandwichApplied,
      'isLateIn': instance.isLateIn,
      'isGraceApplied': instance.isGraceApplied,
      'isOtApplied': instance.isOtApplied,
      'isOutdoorApplied': instance.isOutdoorApplied,
      'isMobilepunchApplied': instance.isMobilepunchApplied,
      'isManualPunchApplied': instance.isManualPunchApplied,
      'isRegularizeApplied': instance.isRegularizeApplied,
      'shiftId': instance.shiftId,
      'shift_InTime': instance.shiftInTime,
      'shift_OutTime': instance.shiftOutTime,
      'isNightShift': instance.isNightShift,
      'attendanceDt': instance.attendanceDt,
      '_InTime': instance.inTime,
      '_OutTime': instance.outTime,
      'empId': instance.empId,
      'paidStatus': instance.paidStatus,
      'dayStatus': instance.dayStatus,
      'paidStatusName': instance.paidStatusName,
      'dayStatusName': instance.dayStatusName,
    };

AttendanceSummary _$AttendanceSummaryFromJson(Map<String, dynamic> json) =>
    AttendanceSummary(
      totalDay: (json['totalDay'] as num).toInt(),
      totalPaidDay: (json['totalPaidDay'] as num).toInt(),
      totalUnPaidDay: (json['totalUnPaidDay'] as num).toInt(),
      totalHoliday: (json['totalHoliday'] as num).toInt(),
      totalWeekOff: (json['totalWeekOff'] as num).toInt(),
      totalPaidLeave: (json['totalPaidLeave'] as num).toInt(),
    );

Map<String, dynamic> _$AttendanceSummaryToJson(AttendanceSummary instance) =>
    <String, dynamic>{
      'totalDay': instance.totalDay,
      'totalPaidDay': instance.totalPaidDay,
      'totalUnPaidDay': instance.totalUnPaidDay,
      'totalHoliday': instance.totalHoliday,
      'totalWeekOff': instance.totalWeekOff,
      'totalPaidLeave': instance.totalPaidLeave,
    };
