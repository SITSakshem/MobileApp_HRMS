import 'dart:developer';

class NetworkValues {
  NetworkValues._(); // private constructor

  static const String VALIDATE_COMMON_ORGANIZATION = "https://wcf.galway.in/HRMS.svc/GetDomain";

  static String QA_GET_COMPANY_DOMAIN = "http://qa.ourhrms.com/ah/";
  static String GET_COMPANY_CODE = ""; // Default company code
  static String LIVE_DOMAIN = "https://ah.ourhrms.com/"; // Default base URL

  // Function to update the base URL
  static void setCompanyCode(String companyCode, String companyBaseDomain) {
    GET_COMPANY_CODE = companyCode;
    LIVE_DOMAIN = companyBaseDomain;
    //LIVE_DOMAIN = 'https://$companyCode.ourhrms.com/';
    QA_GET_COMPANY_DOMAIN = 'http://qa.ourhrms.com/$companyCode/';
    log("Updated COMPANY_CODE: $GET_COMPANY_CODE");
    log("Updated Base URL: $LIVE_DOMAIN");
    print("Updated COMPANY_CODE: $GET_COMPANY_CODE");
    print("Updated Base URL: $LIVE_DOMAIN");
  }

  // Wrapper function to be called when user enters a company code
  static void onCompanyCodeEntered(String companyCode, String companyBaseDomain) {
    String companyCode1 = companyCode.toLowerCase();
    String companyDomain = companyBaseDomain.toLowerCase();
    print("Company Code Entered: $companyCode1");
    setCompanyCode(companyCode1, companyDomain); // Update the base URL
  }

  //static const String QA_DOMAIN_MB= 'http://qa.ourhrms.com/mshr/';
  //static const String LIVE_DOMAIN = 'https://ah.ourhrms.com/';
  static const String QA_DOMAIN_AH= 'http://qa.ourhrms.com/ah/';
  static const String API_KEY = '7B2322F8-DFB6-47F0-AEE6-91231F8FD46D';

  /* -------------------- END Point ------------------ */


  /* -------------------- HEADER ------------------ */
  static const String CONTENT_TYPE = 'Content-Type';
  static const String ACCEPT = 'Accept';

  /* -------------------- KEY ------------------ */
  static const String TOKEN = 'Token';
  static const String SALT = 'Salt';
  static const String EMP_ID = 'EmpId';
  static const String USER_ID = 'UserId';
  static const String COMPANY_ID = 'CompanyId';
  static const String ORG_ID = 'OrgId';
  static const String ORG_CODE = 'OrgCode';
  static const String USER_NAME = 'UserName';
  static const String ROLE = 'Role';
  static const String From_DATE = 'FromDt';
  static const String TO_DATE = 'ToDt';
  static const String INCLUDE_DELETED = 'IncludeDeleted';
  static const String INCLUDE_PENDING = 'IncludePending';
  static const String DOWNLINE_EMP_ID = 'id';
  static const String ZONE_ID = 'id';
  static const String LOCATION_ID = 'id';
  static const String LEAVE_TYPE = 'LeaveType';
  static const String APPLICABILITY_TYPE = 'ApplicabilityType';
  static const String REQUESTED_REMARKS = 'RequestedRemarks';
  static const String TRANSACTION_NUMBER = 'transactionNo';
  static const String APPROVAL_STATUS = 'approvalStatus';
  static const String APPROVAL_REMARKS = 'ApprovalRemarks';
  static const String IN_TIME = '_InTime';
  static const String OUT_TIME = '_OutTime';
  static const String ATTENDANCE_DATE = 'AttendanceDt';
  static const String DATE = 'Date';
  static const String punchType = 'PunchType';
  static const String punchTime = 'PunchTime';
  static const String longitude = 'Longitude';
  static const String latitude = 'Latitude';
  static const String description = 'Description';
  static const String attachmentFile = 'Attachementfile';
  static const String locationAddress = 'LocationAddress';
  static const String weekOfYear = 'weekOfYear';
  static const String dateOfRoute = 'dateOfRoute';
  static const String empId = 'empId';


}

class EndPoint {
  //static const String VALIDATE_COMMON_ORGANIZATION = "https://wcf.galway.in/HRMS.svc/GetDomain";
  static const String GET_ORG_DOMAIN = "HRMS.svc/GetDomain";
  static const String GET_SALT = "api/HRMS/GetSalt";
  static const String LOGIN = "api/HRMS/Login";
  static const String FORGOT_PASSWORD = "api/HRMS/ForgotPassword";
  static const String LEAVE_TYPE = "api/HRMS/LeaveType";
  static const String LEAVE_BALANCE = "api/HRMS/LeaveBalance";
  static const String GET_APPRENTICE = "api/HRMS/GetApprentice";
  static const String GET_LEAVE_APPLICATION = "api/HRMS/GetLeaveApplication";
  static const String LEAVE_APPROVAL = "api/HRMS/LeaveApproval";
  static const String LEAVE_APPLICATION = "api/HRMS/LeaveApplication";
  static const String ATTENDANCE_APPLICATION = "api/HRMS/AttendanceApplication";
  static const String GET_ATTENDANCE_APPLICATION = "api/HRMS/GetAttendanceApplication";
  static const String GET_MOBILE_PUNCH_REPORT = "api/HRMS/GetMobilePunch";
  static const String APPLY_COMP_OFF = "api/HRMS/CompOffRaiseApplication";
  static const String GET_EMP_COMP_OFF_DATE = "api/HRMS/GetEmpCompoffDate";
  static const String GET_COMP_OFF_RAISE_APPLICATION = "api/HRMS/GetCompOffRaiseApplication";
  static const String COMP_OFF_RAISE_APPROVAL = "api/HRMS/CompOffRaiseApproval";
  static const String APPLY_OUTDOOR = "api/HRMS/OutdoorApplication";
  static const String GET_OUTDOOR_APPLICATION = "api/HRMS/GetOutdoorApplication";
  static const String UPDATE_OUTDOOR_REQUEST_STATUS = "api/HRMS/OutdoorApproval";
  static const String mobilePunch = "api/HRMS/MobilePunch";
  static const String getWeekMaster = "api/HRMS/GetWeekMaster";
  static const String getRoutePlanMaster = "api/Sales/getRoutePlan";
  static const String getLocation = "api/HRMS/GetLocation/true";
  static const String getStoreItem = "api/Sales/GetItemMaster";
  static const String saveStoreSalesBooking = "api/Sales/SaveStoreSalesBooking";
  static const String saveStoreSales = "api/Sales/SaveStoreSales";
  static const String savePurchaseOrder = "api/Sales/SavePurchaseOrder";
  static const String getDayStatus = "api/HRMS/GetDayStatus";
  static const String saveRoutePlan = "api/Sales/SaveRoutePlan";
  static const String getStoreReport = "api/HRMS/GetStoreLocation";
  static const String getTotalSalesAmountReport = "api/Sales/getTotalSalesAmount";
  static const String getTotalSalesBookingReport = "api/Sales/getTotalSalesBooking";
}
