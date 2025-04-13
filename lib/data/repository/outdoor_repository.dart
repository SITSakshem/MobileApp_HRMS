


import '../local/user_data.dart';
import '../model/base_response.dart';
import '../model/outdoor_response.dart';
import '../remote/result.dart';
import 'base_repository.dart';

class OutdoorRepository extends BaseRepository {


  Future<Result> getOutdoorApplication(UserData data, String fromDate, String toDate, bool includePending, int downLineEmployeeId) async {
    try {
      OutdoorReportResponse response = await client.getOutdoorApplication(data.token, data.salt, data.companyId, data.orgId,
        data.orgCode, data.empId, data.userId, data.userName, data.userRole, fromDate, toDate, includePending, downLineEmployeeId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> postOutdoorApplication(UserData data, String inTime, String outTime, String date, String remark) async {
    try {
      BaseResponse response = await client.applyOutdoor(data.token, data.salt, data.companyId, data.orgId,
        data.orgCode, data.empId, data.userId, data.userName, data.userRole, inTime, outTime, data.empId, date, remark);
        return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> updateOutdoorRequestStatus(UserData data, int transactionNumber, int approvalStatus, String remark) async {
    try {
      BaseResponse response = await client.updateOutdoorRequestStatus(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, transactionNumber, approvalStatus, remark);
        return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }
}