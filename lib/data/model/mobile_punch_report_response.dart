
import 'package:json_annotation/json_annotation.dart';

part 'mobile_punch_report_response.g.dart';


@JsonSerializable()
class MobilePunchReportResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  List<MobilePunchReport> data;
  String? token;

  MobilePunchReportResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static MobilePunchReportResponse fromJson(Map<String, dynamic> json) => _$MobilePunchReportResponseFromJson(json);

}



@JsonSerializable()
class MobilePunchReport {
  String attendanceDt;
  String companyName;
  int? companyId;
  String? zoneName;
  int? zoneId;
  String? locationName;
  int? locationId;
  String? deptName;
  int? deptId;
  String? empName;
  int? empId;
  String? longitude;
  String? latitude;
  String? locationAddress;
  int? punchType;
  String? punchTime;
  String? punchTypeName;
  String? attachement;
  String? description;


  MobilePunchReport({
    required this.attendanceDt,
    required this.companyName,
    required this.companyId,
    required this.zoneName,
    required this.zoneId,
    required this.locationName,
    required this.locationId,
    required this.deptName,
    required this.deptId,
    required this.empName,
    required this.empId,
    required this.longitude,
    required this.latitude,
    required this.locationAddress,
    required this.punchType,
    required this.punchTime,
    required this.punchTypeName,
    required this.attachement,
    required this.description
  });

  static MobilePunchReport fromJson(Map<String, dynamic> json) => _$MobilePunchReportFromJson(json);

}
