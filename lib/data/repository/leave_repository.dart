import 'package:hrms/data/model/leave_application_response.dart';

import '../local/user_data.dart';
import '../model/base_response.dart';
import '../model/downline_emp_list.dart';
import '../model/leave_balance.dart';
import '../model/leave_type_response.dart';
import '../model/login_response.dart';
import '../remote/result.dart';
import 'base_repository.dart';

class LeaveRepository extends BaseRepository {
  Future<Result> getLeaveBalance(UserData data) async {
    try {
      LeaveBalanceResponse response = await client.getLeaveBalance(
          data.token, data.salt, data.companyId, data.orgId, data.orgCode, data.empId, data.userId, data.userName, data.empId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getApprentice(UserData data) async {
    try {
      DownLineEmpResponse response =
          await client.getApprentice(data.token, data.salt, data.companyId, data.orgId, data.orgCode, data.empId, data.userId, data.userName);
      if (response.data.isNotEmpty) {
        return Success(response.data);
      } else {
        return Failure(response.message);
      }
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getLeaveType(UserData data) async {
    try {
      LeaveTypeResponse response =
          await client.getLeaveType(data.token, data.salt, data.companyId, data.orgId, data.orgCode, data.empId, data.userId, data.userName);
      if (response.data != null) {
        return Success(response.data);
      } else {
        return Failure(response.message);
      }
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getLeaveApplication(UserData data, String fromDate, String toDate, bool includePending, int downLineEmployeeId) async {
    try {
      LeaveApplicationResponse response = await client.getLeaveApplication(data.token, data.salt, data.companyId, data.orgId, data.orgCode,
          data.empId, data.userId, data.userName, data.userRole, fromDate, toDate, includePending, downLineEmployeeId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> postLeaveApplication(UserData data, String fromDate, String toDate, int leaveTypeId, int applicabilityTypeId, String remark) async {
    try {
      BaseResponse response = await client.postLeaveApplication(data.token, data.salt, data.companyId, data.orgId, data.orgCode, data.empId,
          data.userId, data.userName, data.userRole, fromDate, toDate, data.empId, leaveTypeId, applicabilityTypeId, remark);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> approveLeave(UserData data, int transactionNumber, int approvalStatus, String remark) async {
    try {
      BaseResponse response = await client.approveLeave(data.token, data.salt, data.companyId, data.orgId, data.orgCode, data.empId, data.userId,
          data.userName, data.userRole, transactionNumber, approvalStatus, remark);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }
}
