import 'package:json_annotation/json_annotation.dart';

/// messageType : 1
/// error : null
/// message : "Data Loaded"
/// returnId : [{"sno":3,"empId":20,"date":"2024-08-01T00:00:00","status":1,"createdBy":"BA130","createdDate":"2024-07-31T16:49:32.5299893","modifyDate":null,"modifyBy":null,"routePlanDetails":[{"routeName":"AMC-delhi","routePurpose":"Office Visit","sequence":1,"locationId":14,"mobilePunchId":null}]},{"sno":5,"empId":20,"date":"2024-08-01T00:00:00","status":1,"createdBy":"BA130","createdDate":"2024-07-31T16:55:37.024393","modifyDate":null,"modifyBy":null,"routePlanDetails":[{"routeName":"BBS-Delhi","routePurpose":"Office Visit","sequence":1,"locationId":9,"mobilePunchId":null}]}]
/// token : null

class GetTotalSaleBookingReportResponse {
  GetTotalSaleBookingReportResponse({
    this.messageType,
    this.error,
    this.message,
    this.returnId,
    this.token,
  });

  GetTotalSaleBookingReportResponse.fromJson(dynamic json) {
    messageType = json['messageType'];
    error = json['error'];
    message = json['message'];
    if (json['returnId'] != null) {
      returnId = [];
      json['returnId'].forEach((v) {
        returnId?.add(SaleReturnIdList.fromJson(v));
      });
    }
    token = json['token'];
  }

  num? messageType;
  dynamic error;
  String? message;
  List<SaleReturnIdList>? returnId;
  dynamic token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messageType'] = messageType;
    map['error'] = error;
    map['message'] = message;
    if (returnId != null) {
      map['returnId'] = returnId?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }
}

/// sno : 3
/// empId : 20
/// date : "2024-08-01T00:00:00"
/// status : 1
/// createdBy : "BA130"
/// createdDate : "2024-07-31T16:49:32.5299893"
/// modifyDate : null
/// modifyBy : null
/// routePlanDetails : [{"routeName":"AMC-delhi","routePurpose":"Office Visit","sequence":1,"locationId":14,"mobilePunchId":null}]

class SaleReturnIdList {
  SaleReturnIdList({
    this.bookingId,
    this.bookingDt,
    this.customerName,
    this.customerContact,
    this.isClose,
    this.isCompleted,
    this.closingRemarks,
    this.isActive,
    this.remarks,
    this.modifiedDt,
    this.modifiedBy,
    this.salesDetails,
  });

  SaleReturnIdList.fromJson(dynamic json) {
    bookingId = json['bookingId'];
    bookingDt = json['bookingDt'];
    customerName = json['customerName'];
    customerContact = json['customerContact'];
    isClose = json['isClose'];
    isCompleted = json['isCompleted'];
    closingRemarks = json['closingRemarks'];
    isActive = json['isActive'];
    remarks = json['remarks'];
    modifiedDt = json['modifiedDt'];
    modifiedBy = json['modifiedBy'];
    if (json['salesDetails'] != null) {
      salesDetails = [];
      json['salesDetails'].forEach((v) {
        salesDetails?.add(SalesDetails.fromJson(v));
      });
    }
  }

  num? bookingId;
  String? bookingDt;
  String? customerName;
  String? customerContact;
  bool? isClose;
  bool? isCompleted;
  String? closingRemarks;
  bool? isActive;
  String? remarks;
  dynamic modifiedDt;
  dynamic modifiedBy;
  List<SalesDetails>? salesDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bookingId'] = bookingId;
    map['bookingDt'] = bookingDt;
    map['customerName'] = customerName;
    map['customerContact'] = customerContact;
    map['isClose'] = isClose;
    map['isCompleted'] = isCompleted;
    map['closingRemarks'] = closingRemarks;
    map['isActive'] = isActive;
    map['remarks'] = remarks;
    map['modifiedDt'] = modifiedDt;
    map['modifiedBy'] = modifiedBy;
    if (SalesDetails != null) {
      map['salesDetails'] = salesDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SalesDetails {
  SalesDetails(
      {this.salesId,
      this.itemRate,
      this.qty,
      this.totalAmt,
      this.itemId,
      this.itemName,
      this.itemGroupId,
      this.itemGroupName,
      this.batch});

  SalesDetails.fromJson(dynamic json) {
    salesId = json['salesId'];
    itemRate = json['itemRate'];
    qty = json['qty'];
    totalAmt = json['totalAmt'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemGroupId = json['itemGroupId'];
    itemGroupName = json['itemGroupName'];
    batch = json['batch'];
  }

  num? salesId;
  num? itemRate;
  num? qty;
  num? totalAmt;
  num? itemId;
  String? itemName;
  num? itemGroupId;
  String? itemGroupName;
  String? batch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['salesId'] = salesId;
    map['itemRate'] = itemRate;
    map['qty'] = qty;
    map['totalAmt'] = totalAmt;
    map['itemId'] = itemId;
    map['itemName'] = itemName;
    map['itemGroupId'] = itemGroupId;
    map['itemGroupName'] = itemGroupName;
    map['batch'] = batch;
    return map;
  }

}
