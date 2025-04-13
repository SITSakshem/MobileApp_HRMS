import '../local/user_data.dart';

import '../model/applied_comp_off_response.dart';
import '../model/available_comp_off_response.dart';
import '../model/base_response.dart';
import '../remote/result.dart';
import 'base_repository.dart';

class CompOffRepository extends BaseRepository {


  Future<Result> getEmployeeCompOff(UserData data) async {
    try {
      AvailableCompOffResponse response = await client.getEmployeeCompOff(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, data.empId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getCompOffRaiseApplication(UserData data, String fromDate, String toDate, bool includePending, int downLineEmployeeId) async {
    try {
      AppliedCompOffResponse response = await client.getCompOffRaiseApplication(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, fromDate, toDate, includePending, downLineEmployeeId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> applyCompOff(UserData data, String inTime, String outTime, String date, String remark) async {
    try {
      BaseResponse response = await client.applyCompOff(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, inTime, outTime, data.empId, date,
           remark);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

}