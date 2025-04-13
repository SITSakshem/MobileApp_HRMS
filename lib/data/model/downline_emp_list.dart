
import 'package:json_annotation/json_annotation.dart';
part 'downline_emp_list.g.dart';

@JsonSerializable()
class DownLineEmpResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  List<DownLineEmp> data;
  String? token;

  DownLineEmpResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static DownLineEmpResponse fromJson(Map<String, dynamic> json) => _$DownLineEmpResponseFromJson(json);

}

@JsonSerializable()
class DownLineEmp {
  @JsonKey(name: "id")
  int downLineEmpId;
  @JsonKey(name: "code")
  String downLineEmpCode;
  @JsonKey(name: "empName")
  String downLineEmpName;
  @JsonKey(name: "isActive")
  bool downLineIsActive;
  @JsonKey(name: "companyId")
  int downLineEmpCompanyId;
  @JsonKey(name: "hr_spoc_Id")
  int downLineHrSpocId;
  @JsonKey(name: "manager_Id")
  int managerID;
  @JsonKey(name: "deptId")
  int downLineEmpDeptID;
  @JsonKey(name: "locationId")
  int downLineEmpLocationID;
  @JsonKey(name: "zoneId")
  int downLineEmpZoneID;
  @JsonKey(name: "managerName")
  String? downLineEmpManagerName;
  @JsonKey(name: "hrSpocName")
  String? downLineEmpHrSpocName;
  @JsonKey(name: "depth")
  int downLineEmpDepth;
  @JsonKey(name: "rootManager")
  int downLineEmpRootManager;

  DownLineEmp({
    required this.downLineEmpId,
    required this.downLineEmpCode,
    required this.downLineEmpName,
    required this.downLineIsActive,
    required this.downLineEmpCompanyId,
    required this.downLineHrSpocId,
    required this.managerID,
    required this.downLineEmpDeptID,
    required this.downLineEmpLocationID,
    required this.downLineEmpZoneID,
    required this.downLineEmpManagerName,
    required this.downLineEmpHrSpocName,
    required this.downLineEmpDepth,
    required this.downLineEmpRootManager,
  });

  static DownLineEmp allItem() {
    return DownLineEmp(downLineEmpId: 0,
        downLineEmpCode: "",
        downLineEmpName: "All",
        downLineIsActive: false,
        downLineEmpCompanyId: 0,
        downLineHrSpocId: 0,
        managerID: 0,
        downLineEmpDeptID: 0,
        downLineEmpLocationID: 0,
        downLineEmpZoneID: 0,
        downLineEmpManagerName: "",
        downLineEmpHrSpocName: "",
        downLineEmpDepth: 0,
        downLineEmpRootManager: 0);
  }

  static DownLineEmp fromJson(Map<String, dynamic> json) => _$DownLineEmpFromJson(json);

}

