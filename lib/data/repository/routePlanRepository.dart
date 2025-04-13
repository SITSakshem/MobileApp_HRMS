import 'package:hrms/data/model/getNewRoutePlanResponse.dart';
import 'package:hrms/data/model/getWeekMasterResponse.dart';
import 'package:hrms/data/repository/base_repository.dart';

import '../local/user_data.dart';
import '../model/getAllLocationResponse.dart';
import '../model/getStoreItemResponseNew.dart';
import '../model/saveSaleModulRespone.dart';
import '../model/storemodule/get_store_report_response.dart';
import '../remote/result.dart';

class RoutePlanRepository extends BaseRepository{


  Future<Result> getRoutePlanApi(UserData data,  String dateOfRoute,empId) async {
    try {
      GetNewRoutePlanResponse response = await client.getRoutePlanMasterApi(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole,empId, dateOfRoute);
      return Success(response.returnId);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getWeekPlanAPI(UserData data, int weekOfYear) async {
    try {
      GetWeekMasterResponse response = await client.getWeekMasterApi(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, weekOfYear);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getAllLocationAPI(UserData data) async {
    try {
      GetAllLocationResponse response = await client.getLocationApi(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }


  Future<Result> getStoreItemAPI(UserData data) async {
    try {
      GetStoreItemResponseNew response = await client.getStoreItemApi(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> saveStoreItemAPI(UserData data,bookingDate,remark,
      customerName,customerContact,locationId,isActive,salesDetails) async {
    try {
      Map<String, dynamic> request={'BookingDt':bookingDate,'Remarks':remark,
        'CustomerName':customerName,'customerContact':customerContact,
        'EmpId':data.empId.toString(),'LocationId':locationId,'isActive':isActive,'SalesDetails':salesDetails};
      SaveSaleModulRespone response = await client.saveStoreSalesBooking(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole,request);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> saveDailySaleItemAPI(UserData data,bookingDate,remark,
      locationId,isActive,salesDetails) async {
    try {
      Map<String, dynamic> request={'TransactionDt':bookingDate,'Remarks':remark,
        'EmpId':data.empId.toString(),'LocationId':locationId,'isActive':isActive,'SalesDetails':salesDetails};
      SaveSaleModulRespone response = await client.saveStoreSales(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole,request);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> savePurchaseEntryAPI(UserData data,bookingDate,remark,
      isActive,salesDetails) async {
    try {
      Map<String, dynamic> request={'TransactionDt':bookingDate,'Remarks':remark,
        'EmpId':data.empId.toString(),'LocationId':data.empLocationID,'isActive':isActive,'PurchaseDetails':salesDetails};
      SaveSaleModulRespone response = await client.savePurchaseOrder(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole,request);
      return Success(response);
        } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> saveRoutePlanAPI(UserData data,bookingDate, routeDetails,empId,statusType) async {
    try {
      Map<String, dynamic> request={'empId':empId,'date':bookingDate,
        'status':statusType,'RoutePlanDetails':routeDetails};
      SaveSaleModulRespone response = await client.saveRoutePlan(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole,request);
      return Success(response);
        } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }


}