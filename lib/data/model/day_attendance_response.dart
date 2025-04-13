import 'package:json_annotation/json_annotation.dart';

part 'day_attendance_response.g.dart';

@JsonSerializable()
class DayAttendanceResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  DayAttendance? data;
  String? token;

  DayAttendanceResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static DayAttendanceResponse fromJson(Map<String, dynamic> json) => _$DayAttendanceResponseFromJson(json);
}

@JsonSerializable()
class DayAttendance {
  List<Attendance> attendance;
  AttendanceSummary attendanceSummary;

  DayAttendance({
    required this.attendance,
    required this.attendanceSummary,
  });

  static DayAttendance fromJson(Map<String, dynamic> json) => _$DayAttendanceFromJson(json);

}

@JsonSerializable()
class Attendance {
  bool isHoliday;
  bool isWeekoff;
  bool isLeaveApplied;
  bool isPaidLeave;
  int leaveType;
  int applicabilityType;
  bool isSandwichApplied;
  bool isLateIn;
  bool isGraceApplied;
  bool isOtApplied;
  bool isOutdoorApplied;
  bool isMobilepunchApplied;
  bool isManualPunchApplied;
  bool isRegularizeApplied;
  int shiftId;
  @JsonKey(name: "shift_InTime")
  String shiftInTime;
  @JsonKey(name: "shift_OutTime")
  String shiftOutTime;
  bool isNightShift;
  String attendanceDt;
  @JsonKey(name: "_InTime")
  String inTime;
  @JsonKey(name: "_OutTime")
  String outTime;
  int empId;
  int paidStatus;
  int dayStatus;
  String paidStatusName;
  String dayStatusName;

  Attendance({
    required this.isHoliday,
    required this.isWeekoff,
    required this.isLeaveApplied,
    required this.isPaidLeave,
    required this.leaveType,
    required this.applicabilityType,
    required this.isSandwichApplied,
    required this.isLateIn,
    required this.isGraceApplied,
    required this.isOtApplied,
    required this.isOutdoorApplied,
    required this.isMobilepunchApplied,
    required this.isManualPunchApplied,
    required this.isRegularizeApplied,
    required this.shiftId,
    required this.shiftInTime,
    required this.shiftOutTime,
    required this.isNightShift,
    required this.attendanceDt,
    required this.inTime,
    required this.outTime,
    required this.empId,
    required this.paidStatus,
    required this.dayStatus,
    required this.paidStatusName,
    required this.dayStatusName,
  });

  static Attendance fromJson(Map<String, dynamic> json) => _$AttendanceFromJson(json);

  @override
  String toString() {
    return 'Attendance{isHoliday: $isHoliday, isWeekoff: $isWeekoff, isLeaveApplied: $isLeaveApplied, isPaidLeave: $isPaidLeave, isManualPunchApplied: $isManualPunchApplied, attendanceDt: $attendanceDt, inTime: $inTime, outTime: $outTime, paidStatus: $paidStatus, paidStatusName: $paidStatusName, dayStatusName: $dayStatusName}';
  }
}

@JsonSerializable()
class AttendanceSummary {
  int totalDay;
  int totalPaidDay;
  int totalUnPaidDay;
  int totalHoliday;
  int totalWeekOff;
  int totalPaidLeave;

  AttendanceSummary({
    required this.totalDay,
    required this.totalPaidDay,
    required this.totalUnPaidDay,
    required this.totalHoliday,
    required this.totalWeekOff,
    required this.totalPaidLeave,
  });

  static AttendanceSummary fromJson(Map<String, dynamic> json) => _$AttendanceSummaryFromJson(json);
}
