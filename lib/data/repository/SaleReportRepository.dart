import 'package:hrms/data/repository/base_repository.dart';

import '../local/user_data.dart';
import '../model/storemodule/get_store_report_response.dart';
import '../model/storemodule/get_total_sale_booking_report_response.dart';
import '../model/storemodule/get_total_sales_amount_report_response.dart';
import '../remote/result.dart';

class SaleReportRepository extends BaseRepository{


  Future<Result> getStoreReportAPI(UserData data) async {
    try {
      GetStoreReportResponse response = await client.getStoreReportApi(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, data.zoneId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getTotalSaleAmountReportAPI(UserData data) async {
    try {
      GetTotalSaleAmountReportResponse response = await client.getTotalSalesAmountReportApi(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, data.zoneId, data.empLocationID);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getTotalSaleBookingReportAPI(UserData data) async {
    try {
      GetTotalSaleBookingReportResponse response = await client.getTotalSalesBookingReportApi(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, data.zoneId, data.empLocationID);
      return Success(response.returnId);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }


}