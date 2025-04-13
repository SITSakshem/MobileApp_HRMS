
import '../../data/model/login_response.dart';

class UserData {
  int empId;
  String empName;
  String userId;
  String userName;
  String token;
  int orgId;
  String orgCode;
  String userRole;
  int companyId;
  String salt;
  String designation;
  String department;
  String joiningDate;
  String birthDate;
  bool isMobilePunchApplicable;
  String empCode;
  String empShiftName;
  String empWeekoffName;
  String? empCompany;
  int zoneId;
  String empZone;
  String empLocation;
  int empLocationID;

  UserData(
      {this.empId = 0,
      this.empName = "",
      this.userId = "",
      this.userName = "",
      this.token = "",
      this.orgId = 0,
      this.orgCode = "",
      this.userRole = "",
      this.companyId = 0,
      this.salt = "",
      this.designation = "",
      this.department = "",
      this.joiningDate = "",
      this.birthDate = "",
      this.isMobilePunchApplicable = false,
      this.empCode = "",
      this.empShiftName = "",
      this.empWeekoffName = "",
      this.empCompany = "",
        this.zoneId = 1,
        this.empZone = "",
        this.empLocation = "",
        this.empLocationID = 0
      });

  void setLoginModel(String token, Login loginResponse) {
    this.token = token;
    empId = loginResponse.empId;
    userName = loginResponse.userName;
    userId = loginResponse.userId;
    companyId = loginResponse.companyId;
    orgId = loginResponse.orgId;
    orgCode = loginResponse.orgCode;
    userRole = loginResponse.userRole;
    salt = loginResponse.salt;
    joiningDate = loginResponse.empDetails.basicDetails.joiningDt;
    birthDate = "";
    isMobilePunchApplicable = loginResponse.empDetails.attendanceSetting.firstOrNull?.isMobilePunchApplicable ?? false;
    empCode = loginResponse.empDetails.basicDetails.code;
    empShiftName = loginResponse.empDetails.attendanceSetting.firstOrNull?.shiftName ?? "";
    empWeekoffName = loginResponse.empDetails.attendanceSetting.firstOrNull?.weekoffName ?? "";
    empCompany = loginResponse.empDetails.basicDetails.companyName;
    empZone = loginResponse.empDetails.basicDetails.zoneName;
    zoneId = loginResponse.empDetails.basicDetails.zoneId;
    empLocation = loginResponse.empDetails.basicDetails.locationName;
    empLocationID = loginResponse.empDetails.basicDetails.locationId;
  }

  bool canManageTeam() => userRole != 'Employee';
}
