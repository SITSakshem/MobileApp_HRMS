import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrms/data/model/applied_comp_off_response.dart';
import 'package:hrms/data/model/attendance_application_response.dart';
import 'package:hrms/data/model/base_response.dart';
import 'package:hrms/data/model/forgot_password_response.dart';
import 'package:hrms/data/model/getNewRoutePlanResponse.dart';
// import 'package:hrms/data/model/getRoutePlanResponse.dart';
import 'package:hrms/data/model/getWeekMasterResponse.dart';
import 'package:hrms/data/model/day_attendance_response.dart';
import 'package:hrms/data/model/leave_application_response.dart';
import 'package:hrms/data/model/leave_balance.dart';
import 'package:hrms/data/model/leave_type_response.dart';
import 'package:hrms/data/model/org_domain_response.dart';
import 'package:hrms/data/model/outdoor_response.dart';
import 'package:hrms/data/model/saveSaleModulRespone.dart';
import 'package:hrms/data/model/storemodule/get_store_report_response.dart';
import 'package:hrms/data/model/user_validate_response.dart';
import 'package:hrms/data/remote/network_values.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/available_comp_off_response.dart';
import '../model/downline_emp_list.dart';
import '../model/getAllLocationResponse.dart';
import '../model/getStoreItemResponseNew.dart';
import '../model/login_response.dart';
import '../model/mobile_punch_report_response.dart';
import '../model/storemodule/get_total_sale_booking_report_response.dart';
import '../model/storemodule/get_total_sales_amount_report_response.dart';

part 'api_client.g.dart';



@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: const Duration(seconds: 60), connectTimeout: const Duration(seconds: 60));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    baseUrl ??= NetworkValues.LIVE_DOMAIN;
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @POST(NetworkValues.VALIDATE_COMMON_ORGANIZATION)
  Future<GetOrgDomainResponse> validateOrganization(@Body() Map<String, String> request);

  @GET("${EndPoint.GET_SALT}/{${NetworkValues.ORG_CODE}}")
  Future<BaseResponse> getSalt(@Path(NetworkValues.ORG_CODE) String organizationCode);

  @POST(EndPoint.LOGIN)
  Future<LoginResponse> login(@Body() Map<String, String> request);

  @POST(EndPoint.LOGIN)
  Future<ValidateUserResponse> validateUser(@Body() Map<String, String> request);

  @POST(EndPoint.FORGOT_PASSWORD)
  Future<ForgotPasswordResponse> forgotPassword(@Body() Map<String, String> request);

  @GET(EndPoint.LEAVE_TYPE)
  Future<LeaveTypeResponse> getLeaveType(
    @Header(NetworkValues.TOKEN) String token,
    @Header(NetworkValues.SALT) String salt,
    @Header(NetworkValues.COMPANY_ID) int companyId,
    @Header(NetworkValues.ORG_ID) int orgId,
    @Header(NetworkValues.ORG_CODE) String orgCode,
    @Header(NetworkValues.EMP_ID) int empId,
    @Header(NetworkValues.USER_ID) String userId,
    @Header(NetworkValues.USER_NAME) String userName,
  );

  @GET(EndPoint.GET_APPRENTICE)
  Future<DownLineEmpResponse> getApprentice(
    @Header(NetworkValues.TOKEN) String token,
    @Header(NetworkValues.SALT) String salt,
    @Header(NetworkValues.COMPANY_ID) int companyId,
    @Header(NetworkValues.ORG_ID) int orgId,
    @Header(NetworkValues.ORG_CODE) String orgCode,
    @Header(NetworkValues.EMP_ID) int empId,
    @Header(NetworkValues.USER_ID) String userId,
    @Header(NetworkValues.USER_NAME) String userName,
  );

  @GET("${EndPoint.LEAVE_BALANCE}/{${NetworkValues.EMP_ID}}")
  Future<LeaveBalanceResponse> getLeaveBalance(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Path(NetworkValues.EMP_ID) int empId);

  @GET("${EndPoint.GET_LEAVE_APPLICATION}/{${NetworkValues.From_DATE}}/{${NetworkValues.TO_DATE}}/{${NetworkValues.INCLUDE_PENDING}}/{${NetworkValues.DOWNLINE_EMP_ID}}")
  Future<LeaveApplicationResponse> getLeaveApplication(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.From_DATE) String fromDate,
      @Path(NetworkValues.TO_DATE) String toDate,
      @Path(NetworkValues.INCLUDE_PENDING) bool includePending,
      @Path(NetworkValues.DOWNLINE_EMP_ID) int downLineEmployeeId);

  @GET("${EndPoint.LEAVE_APPROVAL}/{${NetworkValues.TRANSACTION_NUMBER}}/{${NetworkValues.APPROVAL_STATUS}}/{${NetworkValues.APPROVAL_REMARKS}}")
  Future<BaseResponse> approveLeave(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.TRANSACTION_NUMBER) int transactionNumber,
      @Path(NetworkValues.APPROVAL_STATUS) int approvalStatus,
      @Path(NetworkValues.APPROVAL_REMARKS) String approvalRemarks);

  @FormUrlEncoded()
  @POST(EndPoint.LEAVE_APPLICATION)
  Future<BaseResponse> postLeaveApplication(
    @Header(NetworkValues.TOKEN) String token,
    @Header(NetworkValues.SALT) String salt,
    @Header(NetworkValues.COMPANY_ID) int companyId,
    @Header(NetworkValues.ORG_ID) int orgId,
    @Header(NetworkValues.ORG_CODE) String orgCode,
    @Header(NetworkValues.EMP_ID) int employeeId,
    @Header(NetworkValues.USER_ID) String userId,
    @Header(NetworkValues.USER_NAME) String userName,
    @Header(NetworkValues.ROLE) String role,
    @Field(NetworkValues.From_DATE) String fromDate,
    @Field(NetworkValues.TO_DATE) String toDate,
    @Field(NetworkValues.EMP_ID) int empId,
    @Field(NetworkValues.LEAVE_TYPE) int leaveType,
    @Field(NetworkValues.APPLICABILITY_TYPE) int applicabilityType,
    @Field(NetworkValues.REQUESTED_REMARKS) String remarks,
  );

  @MultiPart()
  @POST(EndPoint.ATTENDANCE_APPLICATION)
  Future<BaseResponse> attendanceApplication(
    @Header(NetworkValues.TOKEN) String token,
    @Header(NetworkValues.SALT) String salt,
    @Header(NetworkValues.COMPANY_ID) int companyId,
    @Header(NetworkValues.ORG_ID) int orgId,
    @Header(NetworkValues.ORG_CODE) String orgCode,
    @Header(NetworkValues.EMP_ID) int employeeId,
    @Header(NetworkValues.USER_ID) String userId,
    @Header(NetworkValues.USER_NAME) String userName,
    @Header(NetworkValues.ROLE) String role,
    @Part(name: NetworkValues.IN_TIME) String inTime,
    @Part(name: NetworkValues.OUT_TIME) String outTime,
    @Part(name: NetworkValues.EMP_ID) int empId,
    @Part(name: NetworkValues.ATTENDANCE_DATE) String attendanceDate,
    @Part(name: NetworkValues.REQUESTED_REMARKS) String remarks,
    @Part(name: "location") String location,
    @Part(name: "Documentfile") String file,
  );

  @MultiPart()
  @POST(EndPoint.mobilePunch)
  Future<BaseResponse> mobilePunch(
    @Header(NetworkValues.TOKEN) String token,
    @Header(NetworkValues.SALT) String salt,
    @Header(NetworkValues.COMPANY_ID) int companyId,
    @Header(NetworkValues.ORG_ID) int orgId,
    @Header(NetworkValues.ORG_CODE) String orgCode,
    @Header(NetworkValues.EMP_ID) int employeeId,
    @Header(NetworkValues.USER_ID) String userId,
    @Header(NetworkValues.USER_NAME) String userName,
    @Header(NetworkValues.ROLE) String role,
    @Part(name: NetworkValues.punchType) int inTime,
    @Part(name: NetworkValues.punchTime) String outTime,
    @Part(name: NetworkValues.EMP_ID) int empId,
    @Part(name: NetworkValues.description) String description,
    @Part(name: NetworkValues.latitude) double latitude,
    @Part(name: NetworkValues.longitude) double longitude,
    @Part(name: NetworkValues.attachmentFile) File file,
      @Part(name: NetworkValues.locationAddress) String addressFromLatLng
  );

  @GET("${EndPoint.GET_ATTENDANCE_APPLICATION}/{${NetworkValues.From_DATE}}/{${NetworkValues.TO_DATE}}/{${NetworkValues.INCLUDE_PENDING}}/{${NetworkValues.DOWNLINE_EMP_ID}}")
  Future<AttendanceApplicationResponse> getAttendanceApplication(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.From_DATE) String fromDate,
      @Path(NetworkValues.TO_DATE) String toDate,
      @Path(NetworkValues.INCLUDE_PENDING) bool includePending,
      @Path(NetworkValues.DOWNLINE_EMP_ID) int downLineEmployeeId);

  @GET("${EndPoint.GET_MOBILE_PUNCH_REPORT}/{${NetworkValues.From_DATE}}/{${NetworkValues.TO_DATE}}/{${NetworkValues.DOWNLINE_EMP_ID}}")
  Future<MobilePunchReportResponse> getMobilePunchReport(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.From_DATE) String fromDate,
      @Path(NetworkValues.TO_DATE) String toDate,
      @Path(NetworkValues.DOWNLINE_EMP_ID) int downLineEmployeeId);


  @FormUrlEncoded()
  @POST(EndPoint.APPLY_COMP_OFF)
  Future<BaseResponse> applyCompOff(
    @Header(NetworkValues.TOKEN) String token,
    @Header(NetworkValues.SALT) String salt,
    @Header(NetworkValues.COMPANY_ID) int companyId,
    @Header(NetworkValues.ORG_ID) int orgId,
    @Header(NetworkValues.ORG_CODE) String orgCode,
    @Header(NetworkValues.EMP_ID) int employeeId,
    @Header(NetworkValues.USER_ID) String userId,
    @Header(NetworkValues.USER_NAME) String userName,
    @Header(NetworkValues.ROLE) String role,
    @Field(NetworkValues.IN_TIME) String inTime,
    @Field(NetworkValues.OUT_TIME) String outTime,
    @Field(NetworkValues.EMP_ID) int empId,
    @Field(NetworkValues.ATTENDANCE_DATE) String attendanceDate,
    @Field(NetworkValues.REQUESTED_REMARKS) String remarks,
  );

  @GET("${EndPoint.GET_COMP_OFF_RAISE_APPLICATION}/{${NetworkValues.From_DATE}}/{${NetworkValues.TO_DATE}}/{${NetworkValues.INCLUDE_PENDING}}/{${NetworkValues.DOWNLINE_EMP_ID}}")
  Future<AppliedCompOffResponse> getCompOffRaiseApplication(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.From_DATE) String fromDate,
      @Path(NetworkValues.TO_DATE) String toDate,
      @Path(NetworkValues.INCLUDE_PENDING) bool includePending,
      @Path(NetworkValues.DOWNLINE_EMP_ID) int downLineEmployeeId);

  @GET("${EndPoint.GET_EMP_COMP_OFF_DATE}/{${NetworkValues.EMP_ID}}")
  Future<AvailableCompOffResponse> getEmployeeCompOff(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.EMP_ID) int empId);

  @FormUrlEncoded()
  @POST(EndPoint.APPLY_OUTDOOR)
  Future<BaseResponse> applyOutdoor(
    @Header(NetworkValues.TOKEN) String token,
    @Header(NetworkValues.SALT) String salt,
    @Header(NetworkValues.COMPANY_ID) int companyId,
    @Header(NetworkValues.ORG_ID) int orgId,
    @Header(NetworkValues.ORG_CODE) String orgCode,
    @Header(NetworkValues.EMP_ID) int employeeId,
    @Header(NetworkValues.USER_ID) String userId,
    @Header(NetworkValues.USER_NAME) String userName,
    @Header(NetworkValues.ROLE) String role,
    @Field(NetworkValues.IN_TIME) String inTime,
    @Field(NetworkValues.OUT_TIME) String outTime,
    @Field(NetworkValues.EMP_ID) int empId,
    @Field(NetworkValues.ATTENDANCE_DATE) String attendanceDate,
    @Field(NetworkValues.REQUESTED_REMARKS) String remarks,
  );

  @GET("${EndPoint.GET_OUTDOOR_APPLICATION}/{${NetworkValues.From_DATE}}/{${NetworkValues.TO_DATE}}/{${NetworkValues.INCLUDE_PENDING}}/{${NetworkValues.DOWNLINE_EMP_ID}}")
  Future<OutdoorReportResponse> getOutdoorApplication(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.From_DATE) String fromDate,
      @Path(NetworkValues.TO_DATE) String toDate,
      @Path(NetworkValues.INCLUDE_PENDING) bool includePending,
      @Path(NetworkValues.DOWNLINE_EMP_ID) int downLineEmployeeId);

  @GET(
      "${EndPoint.UPDATE_OUTDOOR_REQUEST_STATUS}/{${NetworkValues.TRANSACTION_NUMBER}}/{${NetworkValues.APPROVAL_STATUS}}/{${NetworkValues.APPROVAL_REMARKS}}")
  Future<BaseResponse> updateOutdoorRequestStatus(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.TRANSACTION_NUMBER) int transactionNumber,
      @Path(NetworkValues.APPROVAL_STATUS) int approvalStatus,
      @Path(NetworkValues.APPROVAL_REMARKS) String approvalRemarks);


  @GET('${EndPoint.getWeekMaster}/${NetworkValues.weekOfYear}')
  Future<GetWeekMasterResponse> getWeekMasterApi(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.weekOfYear) int weekOfYear,
    );

  @GET('${EndPoint.getRoutePlanMaster}/${NetworkValues.empId}/${NetworkValues.dateOfRoute}')
  Future<GetNewRoutePlanResponse> getRoutePlanMasterApi(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.empId) int empId,
      @Path(NetworkValues.dateOfRoute) String weekOfYear,
    );

  @GET(EndPoint.getLocation)
  Future<GetAllLocationResponse> getLocationApi(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
    );

  @GET(EndPoint.getStoreItem)
  Future<GetStoreItemResponseNew> getStoreItemApi(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
    );

  @POST(EndPoint.saveStoreSalesBooking)
  Future<SaveSaleModulRespone> saveStoreSalesBooking(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Body() Map<String, dynamic> request
      );

  @POST(EndPoint.saveStoreSales)
  Future<SaveSaleModulRespone> saveStoreSales(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Body() Map<String, dynamic> request
      );

  @POST(EndPoint.savePurchaseOrder)
  Future<SaveSaleModulRespone> savePurchaseOrder(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Body() Map<String, dynamic> request
      );



  @GET("${EndPoint.getDayStatus}/{${NetworkValues.EMP_ID}}/{${NetworkValues.From_DATE}}/{${NetworkValues.TO_DATE}}")
  Future<DayAttendanceResponse> getDayStatus(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Path(NetworkValues.EMP_ID) int empId,
      @Path(NetworkValues.From_DATE) String fromDate,
      @Path(NetworkValues.TO_DATE) String toDate);

  @POST(EndPoint.saveRoutePlan)
  Future<SaveSaleModulRespone> saveRoutePlan(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Body() Map<String, dynamic> request
      );

  @GET("${EndPoint.getStoreReport}/{${NetworkValues.ZONE_ID}}")
  Future<GetStoreReportResponse> getStoreReportApi(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Header(NetworkValues.USER_ID) int zoneId);

  @GET("${EndPoint.getTotalSalesAmountReport}/{${NetworkValues.ZONE_ID}/{${NetworkValues.LOCATION_ID}}")
  Future<GetTotalSaleAmountReportResponse> getTotalSalesAmountReportApi(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Header(NetworkValues.ZONE_ID) int zoneId,
      @Header(NetworkValues.LOCATION_ID) int locationId);

  @GET("${EndPoint.getTotalSalesBookingReport}/{${NetworkValues.ZONE_ID}/{${NetworkValues.LOCATION_ID}}")
  Future<GetTotalSaleBookingReportResponse> getTotalSalesBookingReportApi(
      @Header(NetworkValues.TOKEN) String token,
      @Header(NetworkValues.SALT) String salt,
      @Header(NetworkValues.COMPANY_ID) int companyId,
      @Header(NetworkValues.ORG_ID) int orgId,
      @Header(NetworkValues.ORG_CODE) String orgCode,
      @Header(NetworkValues.EMP_ID) int employeeId,
      @Header(NetworkValues.USER_ID) String userId,
      @Header(NetworkValues.USER_NAME) String userName,
      @Header(NetworkValues.ROLE) String role,
      @Header(NetworkValues.ZONE_ID) int zoneId,
      @Header(NetworkValues.LOCATION_ID) int locationId);


}
