/// messageType : 1
/// error : null
/// message : "Data Loaded"
/// returnId : [{"weekName":"Week-24, 15-Jun-2024","weekStart":"2024-06-09T00:00:00+05:30","weekEnd":"2024-06-15T00:00:00+05:30","weekId":202424},{"weekName":"Week-23, 08-Jun-2024","weekStart":"2024-06-02T00:00:00+05:30","weekEnd":"2024-06-08T00:00:00+05:30","weekId":202423},{"weekName":"Week-22, 25-May-2024","weekStart":"2024-05-19T00:00:00+05:30","weekEnd":"2024-05-25T00:00:00+05:30","weekId":202422},{"weekName":"Week-21, 04-May-2024","weekStart":"2024-04-28T00:00:00+05:30","weekEnd":"2024-05-04T00:00:00+05:30","weekId":202421},{"weekName":"Week-20, 06-Apr-2024","weekStart":"2024-03-31T00:00:00+05:30","weekEnd":"2024-04-06T00:00:00+05:30","weekId":202420},{"weekName":"Week-19, 02-Mar-2024","weekStart":"2024-02-25T00:00:00+05:30","weekEnd":"2024-03-02T00:00:00+05:30","weekId":202419},{"weekName":"Week-18, 20-Jan-2024","weekStart":"2024-01-14T00:00:00+05:30","weekEnd":"2024-01-20T00:00:00+05:30","weekId":202418},{"weekName":"Week-17, 02-Dec-2023","weekStart":"2023-11-26T00:00:00+05:30","weekEnd":"2023-12-02T00:00:00+05:30","weekId":202317},{"weekName":"Week-16, 07-Oct-2023","weekStart":"2023-10-01T00:00:00+05:30","weekEnd":"2023-10-07T00:00:00+05:30","weekId":202316},{"weekName":"Week-15, 05-Aug-2023","weekStart":"2023-07-30T00:00:00+05:30","weekEnd":"2023-08-05T00:00:00+05:30","weekId":202315},{"weekName":"Week-14, 27-May-2023","weekStart":"2023-05-21T00:00:00+05:30","weekEnd":"2023-05-27T00:00:00+05:30","weekId":202314},{"weekName":"Week-13, 11-Mar-2023","weekStart":"2023-03-05T00:00:00+05:30","weekEnd":"2023-03-11T00:00:00+05:30","weekId":202313},{"weekName":"Week-12, 17-Dec-2022","weekStart":"2022-12-11T00:00:00+05:30","weekEnd":"2022-12-17T00:00:00+05:30","weekId":202212},{"weekName":"Week-11, 17-Sep-2022","weekStart":"2022-09-11T00:00:00+05:30","weekEnd":"2022-09-17T00:00:00+05:30","weekId":202211},{"weekName":"Week-10, 11-Jun-2022","weekStart":"2022-06-05T00:00:00+05:30","weekEnd":"2022-06-11T00:00:00+05:30","weekId":202210},{"weekName":"Week-09, 26-Feb-2022","weekStart":"2022-02-20T00:00:00+05:30","weekEnd":"2022-02-26T00:00:00+05:30","weekId":202209},{"weekName":"Week-08, 06-Nov-2021","weekStart":"2021-10-31T00:00:00+05:30","weekEnd":"2021-11-06T00:00:00+05:30","weekId":202108},{"weekName":"Week-07, 10-Jul-2021","weekStart":"2021-07-04T00:00:00+05:30","weekEnd":"2021-07-10T00:00:00+05:30","weekId":202107},{"weekName":"Week-06, 06-Mar-2021","weekStart":"2021-02-28T00:00:00+05:30","weekEnd":"2021-03-06T00:00:00+05:30","weekId":202106},{"weekName":"Week-05, 24-Oct-2020","weekStart":"2020-10-18T00:00:00+05:30","weekEnd":"2020-10-24T00:00:00+05:30","weekId":202005},{"weekName":"Week-04, 06-Jun-2020","weekStart":"2020-05-31T00:00:00+05:30","weekEnd":"2020-06-06T00:00:00+05:30","weekId":202004},{"weekName":"Week-03, 11-Jan-2020","weekStart":"2020-01-05T00:00:00+05:30","weekEnd":"2020-01-11T00:00:00+05:30","weekId":202003},{"weekName":"Week-02, 10-Aug-2019","weekStart":"2019-08-04T00:00:00+05:30","weekEnd":"2019-08-10T00:00:00+05:30","weekId":201902}]
/// token : null

class GetWeekMasterResponse {
  GetWeekMasterResponse({
      num? messageType, 
      dynamic error, 
      String? message, 
      List<ReturnId>? data,
      dynamic token,}){
    _messageType = messageType;
    _error = error;
    _message = message;
    _data = data;
    _token = token;
}

  GetWeekMasterResponse.fromJson(dynamic json) {
    _messageType = json['messageType'];
    _error = json['error'];
    _message = json['message'];
    if (json['returnId'] != null) {
      _data = [];
      json['returnId'].forEach((v) {
        _data?.add(ReturnId.fromJson(v));
      });
    }
    _token = json['token'];
  }
  num? _messageType;
  dynamic _error;
  String? _message;
  List<ReturnId>? _data;
  dynamic _token;
GetWeekMasterResponse copyWith({  num? messageType,
  dynamic error,
  String? message,
  List<ReturnId>? data,
  dynamic token,
}) => GetWeekMasterResponse(  messageType: messageType ?? _messageType,
  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
  token: token ?? _token,
);
  num? get messageType => _messageType;
  dynamic get error => _error;
  String? get message => _message;
  List<ReturnId>? get data => _data;
  dynamic get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messageType'] = _messageType;
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['returnId'] = _data?.map((v) => v.toJson()).toList();
    }
    map['token'] = _token;
    return map;
  }

}

/// weekName : "Week-24, 15-Jun-2024"
/// weekStart : "2024-06-09T00:00:00+05:30"
/// weekEnd : "2024-06-15T00:00:00+05:30"
/// weekId : 202424

class ReturnId {
  ReturnId({
      String? weekName, 
      String? weekStart, 
      String? weekEnd, 
      num? weekId,}){
    _weekName = weekName;
    _weekStart = weekStart;
    _weekEnd = weekEnd;
    _weekId = weekId;
}

  ReturnId.fromJson(dynamic json) {
    _weekName = json['weekName'];
    _weekStart = json['weekStart'];
    _weekEnd = json['weekEnd'];
    _weekId = json['weekId'];
  }
  String? _weekName;
  String? _weekStart;
  String? _weekEnd;
  num? _weekId;
ReturnId copyWith({  String? weekName,
  String? weekStart,
  String? weekEnd,
  num? weekId,
}) => ReturnId(  weekName: weekName ?? _weekName,
  weekStart: weekStart ?? _weekStart,
  weekEnd: weekEnd ?? _weekEnd,
  weekId: weekId ?? _weekId,
);
  String? get weekName => _weekName;
  String? get weekStart => _weekStart;
  String? get weekEnd => _weekEnd;
  num? get weekId => _weekId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['weekName'] = _weekName;
    map['weekStart'] = _weekStart;
    map['weekEnd'] = _weekEnd;
    map['weekId'] = _weekId;
    return map;
  }

}