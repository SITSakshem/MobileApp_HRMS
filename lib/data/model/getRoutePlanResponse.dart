/// messageType : 1
/// error : null
/// message : "Data Loaded"
/// returnId : [{"sno":1,"empId":20,"date":"2024-07-23T00:00:00","routeName":"Noida","routePurpose":"Delivery","sequence":1,"status":1,"createdBy":null,"createdDate":"2024-07-25T22:09:39.0292443+05:30","modifyDate":"2024-07-23T17:58:51.484544","modifyBy":null,"locationId":1,"mobilePunchId":null},{"sno":4,"empId":20,"date":"2024-07-23T00:00:00","routeName":"New Delhi","routePurpose":"Office","sequence":1,"status":1,"createdBy":null,"createdDate":"2024-07-25T22:09:39.0292766+05:30","modifyDate":"2024-07-23T18:02:09.7096997","modifyBy":null,"locationId":1,"mobilePunchId":null},{"sno":2,"empId":20,"date":"2024-07-23T00:00:00","routeName":"New Delhi","routePurpose":"Pickup","sequence":2,"status":1,"createdBy":null,"createdDate":"2024-07-25T22:09:39.0293181+05:30","modifyDate":"2024-07-23T17:58:51.4910134","modifyBy":null,"locationId":1,"mobilePunchId":null},{"sno":3,"empId":20,"date":"2024-07-23T00:00:00","routeName":"Noida","routePurpose":"Office","sequence":2,"status":1,"createdBy":null,"createdDate":"2024-07-25T22:09:39.0293369+05:30","modifyDate":"2024-07-23T18:02:09.7096811","modifyBy":null,"locationId":1,"mobilePunchId":null}]
/// token : null

class GetRoutePlanResponse {
  GetRoutePlanResponse({
    int? messageType,
    dynamic error,
    String? message,
    List<RouteReturnId>? returnId,
    dynamic token,}){
    _messageType = messageType;
    _error = error;
    _message = message;
    _returnId = returnId;
    _token = token;
  }

  GetRoutePlanResponse.fromJson(dynamic json) {
    _messageType = json['messageType'];
    _error = json['error'];
    _message = json['message'];
    if (json['returnId'] != null) {
      _returnId = [];
      json['returnId'].forEach((v) {
        _returnId?.add(RouteReturnId.fromJson(v));
      });
    }
    _token = json['token'];
  }
  int? _messageType;
  dynamic _error;
  String? _message;
  List<RouteReturnId>? _returnId;
  dynamic _token;

  int? get messageType => _messageType;
  dynamic get error => _error;
  String? get message => _message;
  List<RouteReturnId>? get returnId => _returnId;
  dynamic get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messageType'] = _messageType;
    map['error'] = _error;
    map['message'] = _message;
    if (_returnId != null) {
      map['returnId'] = _returnId?.map((v) => v.toJson()).toList();
    }
    map['token'] = _token;
    return map;
  }

}

/// sno : 1
/// empId : 20
/// date : "2024-07-23T00:00:00"
/// routeName : "Noida"
/// routePurpose : "Delivery"
/// sequence : 1
/// status : 1
/// createdBy : null
/// createdDate : "2024-07-25T22:09:39.0292443+05:30"
/// modifyDate : "2024-07-23T17:58:51.484544"
/// modifyBy : null
/// locationId : 1
/// mobilePunchId : null

class RouteReturnId {
  RouteReturnId({
    int? sno,
    int? empId,
    String? date,
    String? routeName,
    String? routePurpose,
    int? sequence,
    int? status,
    dynamic createdBy,
    String? createdDate,
    String? modifyDate,
    dynamic modifyBy,
    int? locationId,
    dynamic mobilePunchId,}){
    _sno = sno;
    _empId = empId;
    _date = date;
    _routeName = routeName;
    _routePurpose = routePurpose;
    _sequence = sequence;
    _status = status;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _modifyDate = modifyDate;
    _modifyBy = modifyBy;
    _locationId = locationId;
    _mobilePunchId = mobilePunchId;
  }

  RouteReturnId.fromJson(dynamic json) {
    _sno = json['sno'];
    _empId = json['empId'];
    _date = json['date'];
    _routeName = json['routeName'];
    _routePurpose = json['routePurpose'];
    _sequence = json['sequence'];
    _status = json['status'];
    _createdBy = json['createdBy'];
    _createdDate = json['createdDate'];
    _modifyDate = json['modifyDate'];
    _modifyBy = json['modifyBy'];
    _locationId = json['locationId'];
    _mobilePunchId = json['mobilePunchId'];
  }
  int? _sno;
  int? _empId;
  String? _date;
  String? _routeName;
  String? _routePurpose;
  int? _sequence;
  int? _status;
  dynamic _createdBy;
  String? _createdDate;
  String? _modifyDate;
  dynamic _modifyBy;
  int? _locationId;
  dynamic _mobilePunchId;

  int? get sno => _sno;
  int? get empId => _empId;
  String? get date => _date;
  String? get routeName => _routeName;
  String? get routePurpose => _routePurpose;
  int? get sequence => _sequence;
  int? get status => _status;
  dynamic get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get modifyDate => _modifyDate;
  dynamic get modifyBy => _modifyBy;
  int? get locationId => _locationId;
  dynamic get mobilePunchId => _mobilePunchId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sno'] = _sno;
    map['empId'] = _empId;
    map['date'] = _date;
    map['routeName'] = _routeName;
    map['routePurpose'] = _routePurpose;
    map['sequence'] = _sequence;
    map['status'] = _status;
    map['createdBy'] = _createdBy;
    map['createdDate'] = _createdDate;
    map['modifyDate'] = _modifyDate;
    map['modifyBy'] = _modifyBy;
    map['locationId'] = _locationId;
    map['mobilePunchId'] = _mobilePunchId;
    return map;
  }

}