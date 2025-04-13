/// messageType : 1
/// error : null
/// message : "Data Loaded"
/// returnId : [{"sno":3,"empId":20,"date":"2024-08-01T00:00:00","status":1,"createdBy":"BA130","createdDate":"2024-07-31T16:49:32.5299893","modifyDate":null,"modifyBy":null,"routePlanDetails":[{"routeName":"AMC-delhi","routePurpose":"Office Visit","sequence":1,"locationId":14,"mobilePunchId":null}]},{"sno":5,"empId":20,"date":"2024-08-01T00:00:00","status":1,"createdBy":"BA130","createdDate":"2024-07-31T16:55:37.024393","modifyDate":null,"modifyBy":null,"routePlanDetails":[{"routeName":"BBS-Delhi","routePurpose":"Office Visit","sequence":1,"locationId":9,"mobilePunchId":null}]}]
/// token : null

class GetNewRoutePlanResponse {
  GetNewRoutePlanResponse({
      this.messageType, 
      this.error, 
      this.message, 
      this.returnId, 
      this.token,});

  GetNewRoutePlanResponse.fromJson(dynamic json) {
    messageType = json['messageType'];
    error = json['error'];
    message = json['message'];
    if (json['returnId'] != null) {
      returnId = [];
      json['returnId'].forEach((v) {
        returnId?.add(RouteReturnId.fromJson(v));
      });
    }
    token = json['token'];
  }
  num? messageType;
  dynamic error;
  String? message;
  List<RouteReturnId>? returnId;
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

class RouteReturnId {
  RouteReturnId({
      this.sno, 
      this.empId, 
      this.date, 
      this.status, 
      this.createdBy, 
      this.createdDate, 
      this.modifyDate, 
      this.modifyBy, 
      this.routePlanDetails,});

  RouteReturnId.fromJson(dynamic json) {
    sno = json['sno'];
    empId = json['empId'];
    date = json['date'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifyDate = json['modifyDate'];
    modifyBy = json['modifyBy'];
    if (json['routePlanDetails'] != null) {
      routePlanDetails = [];
      json['routePlanDetails'].forEach((v) {
        routePlanDetails?.add(RoutePlanDetails.fromJson(v));
      });
    }
  }
  num? sno;
  num? empId;
  String? date;
  num? status;
  String? createdBy;
  String? createdDate;
  dynamic modifyDate;
  dynamic modifyBy;
  List<RoutePlanDetails>? routePlanDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sno'] = sno;
    map['empId'] = empId;
    map['date'] = date;
    map['status'] = status;
    map['createdBy'] = createdBy;
    map['createdDate'] = createdDate;
    map['modifyDate'] = modifyDate;
    map['modifyBy'] = modifyBy;
    if (routePlanDetails != null) {
      map['routePlanDetails'] = routePlanDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// routeName : "AMC-delhi"
/// routePurpose : "Office Visit"
/// sequence : 1
/// locationId : 14
/// mobilePunchId : null

class RoutePlanDetails {
  RoutePlanDetails({
      this.routeName, 
      this.routePurpose, 
      this.sequence, 
      this.locationId, 
      this.mobilePunchId,});

  RoutePlanDetails.fromJson(dynamic json) {
    routeName = json['routeName'];
    routePurpose = json['routePurpose'];
    sequence = json['sequence'];
    locationId = json['locationId'];
    mobilePunchId = json['mobilePunchId'];
  }
  String? routeName;
  String? routePurpose;
  num? sequence;
  num? locationId;
  dynamic mobilePunchId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['routeName'] = routeName;
    map['routePurpose'] = routePurpose;
    map['sequence'] = sequence;
    map['locationId'] = locationId;
    map['mobilePunchId'] = mobilePunchId;
    return map;
  }

}