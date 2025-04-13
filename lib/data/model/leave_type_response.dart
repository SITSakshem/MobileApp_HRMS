
import 'package:json_annotation/json_annotation.dart';
part 'leave_type_response.g.dart';

@JsonSerializable()
class LeaveTypeResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  DataResponse? data;
  String? token;

  LeaveTypeResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static LeaveTypeResponse fromJson(Map<String, dynamic> json) => _$LeaveTypeResponseFromJson(json);

}

@JsonSerializable()
class DataResponse {
  List<LeaveType> leaveType;
  List<ApplicabilityType> applicabilityType;
  List<DayPart> dayPart;

  DataResponse({
    required this.leaveType,
    required this.applicabilityType,
    required this.dayPart,
  });

  static DataResponse fromJson(Map<String, dynamic> json) => _$DataResponseFromJson(json);

}

@JsonSerializable()
class ApplicabilityType {
  int applicabilityTypeId;
  String applicabilityTypeName;

  ApplicabilityType({
    required this.applicabilityTypeId,
    required this.applicabilityTypeName,
  });

  static ApplicabilityType fromJson(Map<String, dynamic> json) => _$ApplicabilityTypeFromJson(json);

}

@JsonSerializable()
class DayPart {
  int dayPartId;
  String dayPartName;

  DayPart({
    required this.dayPartId,
    required this.dayPartName,
  });

  static DayPart fromJson(Map<String, dynamic> json) => _$DayPartFromJson(json);

}

@JsonSerializable()
class LeaveType {
  int leaveTypeId;
  String leaveTypeName;

  LeaveType({
    required this.leaveTypeId,
    required this.leaveTypeName,
  });

  static LeaveType fromJson(Map<String, dynamic> json) => _$LeaveTypeFromJson(json);

}