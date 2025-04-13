/// WeekId : 202423
/// TransactionDt : "2024-05-11T00:00:00Z"
/// Remarks : "Late Entry"
/// EmpId : 11
/// RouteRosterDetails : [{"AttendanceDt":"2024-06-02T00:00:00Z","LocationId1":null,"LocationId2":null,"LocationId3":null,"LocationId4":null},{"AttendanceDt":"2024-06-03T00:00:00Z","LocationId1":1,"LocationId2":null,"LocationId3":null,"LocationId4":null},{"AttendanceDt":"2024-06-04T00:00:00Z","LocationId1":1,"LocationId2":null,"LocationId3":null,"LocationId4":null},{"AttendanceDt":"2024-06-05T00:00:00Z","LocationId1":1,"LocationId2":null,"LocationId3":null,"LocationId4":null},{"AttendanceDt":"2024-06-06T00:00:00Z","LocationId1":1,"LocationId2":null,"LocationId3":null,"LocationId4":null},{"AttendanceDt":"2024-06-07T00:00:00Z","LocationId1":1,"LocationId2":null,"LocationId3":null,"LocationId4":null},{"AttendanceDt":"2024-06-08T00:00:00Z","LocationId1":null,"LocationId2":null,"LocationId3":null,"LocationId4":null}]

class RoutePlanRequest {
  RoutePlanRequest({
      num? weekId, 
      String? transactionDt, 
      String? remarks, 
      num? empId, 
      List<RouteRosterDetails>? routeRosterDetails,}){
    _weekId = weekId;
    _transactionDt = transactionDt;
    _remarks = remarks;
    _empId = empId;
    _routeRosterDetails = routeRosterDetails;
}

  RoutePlanRequest.fromJson(dynamic json) {
    _weekId = json['WeekId'];
    _transactionDt = json['TransactionDt'];
    _remarks = json['Remarks'];
    _empId = json['EmpId'];
    if (json['RouteRosterDetails'] != null) {
      _routeRosterDetails = [];
      json['RouteRosterDetails'].forEach((v) {
        _routeRosterDetails?.add(RouteRosterDetails.fromJson(v));
      });
    }
  }
  num? _weekId;
  String? _transactionDt;
  String? _remarks;
  num? _empId;
  List<RouteRosterDetails>? _routeRosterDetails;
RoutePlanRequest copyWith({  num? weekId,
  String? transactionDt,
  String? remarks,
  num? empId,
  List<RouteRosterDetails>? routeRosterDetails,
}) => RoutePlanRequest(  weekId: weekId ?? _weekId,
  transactionDt: transactionDt ?? _transactionDt,
  remarks: remarks ?? _remarks,
  empId: empId ?? _empId,
  routeRosterDetails: routeRosterDetails ?? _routeRosterDetails,
);
  num? get weekId => _weekId;
  String? get transactionDt => _transactionDt;
  String? get remarks => _remarks;
  num? get empId => _empId;
  List<RouteRosterDetails>? get routeRosterDetails => _routeRosterDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['WeekId'] = _weekId;
    map['TransactionDt'] = _transactionDt;
    map['Remarks'] = _remarks;
    map['EmpId'] = _empId;
    if (_routeRosterDetails != null) {
      map['RouteRosterDetails'] = _routeRosterDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// AttendanceDt : "2024-06-02T00:00:00Z"
/// LocationId1 : null
/// LocationId2 : null
/// LocationId3 : null
/// LocationId4 : null

class RouteRosterDetails {
  RouteRosterDetails({
      String? attendanceDt, 
      dynamic locationId1, 
      dynamic locationId2, 
      dynamic locationId3, 
      dynamic locationId4,}){
    _attendanceDt = attendanceDt;
    _locationId1 = locationId1;
    _locationId2 = locationId2;
    _locationId3 = locationId3;
    _locationId4 = locationId4;
}

  RouteRosterDetails.fromJson(dynamic json) {
    _attendanceDt = json['AttendanceDt'];
    _locationId1 = json['LocationId1'];
    _locationId2 = json['LocationId2'];
    _locationId3 = json['LocationId3'];
    _locationId4 = json['LocationId4'];
  }
  String? _attendanceDt;
  dynamic _locationId1;
  dynamic _locationId2;
  dynamic _locationId3;
  dynamic _locationId4;
RouteRosterDetails copyWith({  String? attendanceDt,
  dynamic locationId1,
  dynamic locationId2,
  dynamic locationId3,
  dynamic locationId4,
}) => RouteRosterDetails(  attendanceDt: attendanceDt ?? _attendanceDt,
  locationId1: locationId1 ?? _locationId1,
  locationId2: locationId2 ?? _locationId2,
  locationId3: locationId3 ?? _locationId3,
  locationId4: locationId4 ?? _locationId4,
);
  String? get attendanceDt => _attendanceDt;
  dynamic get locationId1 => _locationId1;
  dynamic get locationId2 => _locationId2;
  dynamic get locationId3 => _locationId3;
  dynamic get locationId4 => _locationId4;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AttendanceDt'] = _attendanceDt;
    map['LocationId1'] = _locationId1;
    map['LocationId2'] = _locationId2;
    map['LocationId3'] = _locationId3;
    map['LocationId4'] = _locationId4;
    return map;
  }

}