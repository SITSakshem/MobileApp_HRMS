/// messageType : 1
/// error : null
/// message : "Data Loaded"
/// returnId :
/// token : null

class GetTotalSaleAmountReportResponse {
  GetTotalSaleAmountReportResponse({
    num? messageType,
    dynamic error,
    String? message,
    List<GetTotalSaleAmountReportList>? data,
    dynamic token,
  }) {
    _messageType = messageType;
    _error = error;
    _message = message;
    _data = data;
    _token = token;
  }

  GetTotalSaleAmountReportResponse.fromJson(dynamic json) {
    _messageType = json['messageType'];
    _error = json['error'];
    _message = json['message'];
    if (json['returnId'] != null) {
      _data = [];
      json['returnId'].forEach((v) {
        _data?.add(GetTotalSaleAmountReportList.fromJson(v));
      });
    }
    _token = json['token'];
  }

  num? _messageType;
  dynamic _error;
  String? _message;
  List<GetTotalSaleAmountReportList>? _data;
  dynamic _token;

  GetTotalSaleAmountReportResponse copyWith({
    num? messageType,
    dynamic error,
    String? message,
    List<GetTotalSaleAmountReportList>? data,
    dynamic token,
  }) =>
      GetTotalSaleAmountReportResponse(
        messageType: messageType ?? _messageType,
        error: error ?? _error,
        message: message ?? _message,
        data: data ?? _data,
        token: token ?? _token,
      );

  num? get messageType => _messageType;

  dynamic get error => _error;

  String? get message => _message;

  List<GetTotalSaleAmountReportList>? get data => _data;

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

class GetTotalSaleAmountReportList {
  GetTotalSaleAmountReportList({
    num? qty,
    num? itemRate,
    num? totalAmount,
    num? docId,
    String? transactionDt,
    String? remarks,
    num? empId,
    String? empName,
    num? empCode,
    num? itemId,
    String? itemName,
    num? itemGroupId,
    String? itemGroupName,
    num? locationId,
    String? locationName,
    num? zoneId,
    String? zoneName,
    num? companyId,
    String? companyName,
    String? batch,
    String? modifiedDt,
    String? modifiedBy,
  }) {
    _qty = qty;
    _itemRate = itemRate;
    _totalAmount = totalAmount;
    _docId = docId;
    _transactionDt = transactionDt;
    _remarks = remarks;
    _empId = empId;
    _empName = empName;
    _empCode = empCode;
    _itemId = itemId;
    _itemName = itemName;
    _itemGroupId = itemGroupId;
    _itemGroupName = itemGroupName;
    _locationId = locationId;
    _locationName = locationName;
    _zoneId = zoneId;
    _zoneName = zoneName;
    _companyId = companyId;
    _companyName = companyName;
    _batch = batch;
    _modifiedDt = modifiedDt;
    _modifiedBy = modifiedBy;
  }

  GetTotalSaleAmountReportList.fromJson(dynamic json) {
    _qty = json['qty'];
    _itemRate = json['itemRate'];
    _totalAmount = json['totalAmount'];
    _docId = json['docId'];
    _transactionDt = json['transactionDt'];
    _remarks = json['remarks'];
    _empId = json['empId'];
    _empName = json['empName'];
    _empCode = json['empCode'];
    _itemId = json['itemId'];
    _itemName = json['itemName'];
    _itemGroupId = json['itemGroupId'];
    _itemGroupName = json['itemGroupName'];
    _locationId = json['locationId'];
    _locationName = json['locationName'];
    _zoneId = json['zoneId'];
    _zoneName = json['zoneName'];
    _companyId = json['companyId'];
    _companyName = json['companyName'];
    _batch = json['batch'];
    _modifiedDt = json['modifiedDt'];
    _modifiedBy = json['modifiedBy'];

  }

  num? _qty;
  num? _itemRate;
  num? _totalAmount;
  num? _docId;
  String? _transactionDt;
  String? _remarks;
  num? _empId;
  String? _empName;
  num? _empCode;
  num? _itemId;
  String? _itemName;
  num? _itemGroupId;
  String? _itemGroupName;
  num? _locationId;
  String? _locationName;
  num? _zoneId;
  String? _zoneName;
  num? _companyId;
  String? _companyName;
  String? _batch;
  String? _modifiedDt;
  String? _modifiedBy;

  GetTotalSaleAmountReportList copyWith({
    num? qty,
    num? itemRate,
    num? totalAmount,
    num? docId,
    String? transactionDt,
    String? remarks,
    num? empId,
    String? empName,
    num? empCode,
    num? itemId,
    String? itemName,
    num? itemGroupId,
    String? itemGroupName,
    num? locationId,
    String? locationName,
    num? zoneId,
    String? zoneName,
    num? companyId,
    String? companyName,
    String? batch,
    String? modifiedDt,
    String? modifiedBy,
  }) =>
      GetTotalSaleAmountReportList(
        qty: qty ?? _qty,
        itemRate: itemRate ?? _itemRate,
        totalAmount: totalAmount ?? _totalAmount,
        docId: docId ?? _docId,
        transactionDt: transactionDt ?? _transactionDt,
        remarks: remarks ?? _remarks,
        empId: empId ?? _empId,
        empName: empName ?? _empName,
        empCode: empCode ?? _empCode,
        itemId: itemId ?? _itemId,
        itemName: itemName ?? _itemName,
        itemGroupId: itemGroupId ?? _itemGroupId,
        itemGroupName: itemGroupName ?? _itemGroupName,
        locationId: locationId ?? _locationId,
        locationName: locationName ?? _locationName,
        zoneId: zoneId ?? _zoneId,
        zoneName: zoneName ?? _zoneName,
        companyId: companyId ?? _companyId,
        companyName: companyName ?? _companyName,
        batch: batch ?? _batch,
        modifiedDt: modifiedDt ?? _modifiedDt,
        modifiedBy: modifiedBy ?? _modifiedBy,
      );
  num? get qty => _qty;
  num? get itemRate => _itemRate;
  num? get totalAmount => _totalAmount;
  num? get docId => _docId;
  String? get transactionDt => _transactionDt;
  String? get remarks => _remarks;
  num? get empId => _empId;
  String? get empName => _empName;
  num? get empCode => _empCode;
  num? get itemId => _itemId;
  String? get itemName => _itemName;
  num? get itemGroupId => _itemGroupId;
  String? get itemGroupName => _itemGroupName;
  num? get locationId => _locationId;
  String? get locationName => _locationName;
  num? get zoneId => _zoneId;
  String? get zoneName => _zoneName;
  num? get companyId => _companyId;
  String? get companyName => _companyName;
  String? get batch => _batch;
  String? get modifiedDt => _modifiedDt;
  String? get modifiedBy => _modifiedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qty'] = _qty;
    map['itemRate'] = _itemRate;
    map['totalAmount'] = _totalAmount;
    map['docId'] = _docId;
    map['transactionDt'] = _transactionDt;
    map['remarks'] = _remarks;
    map['empId'] = _empId;
    map['empName'] = _empName;
    map['empCode'] = _empCode;
    map['itemId'] = _itemId;
    map['itemName'] = _itemName;
    map['itemGroupId'] = _itemGroupId;
    map['itemGroupName'] = _itemGroupName;
    map['locationId'] = _locationId;
    map['locationName'] = _locationName;
    map['zoneId'] = _zoneId;
    map['zoneName'] = _zoneName;
    map['companyId'] = _companyId;
    map['companyName'] = _companyName;
    map['batch'] = _batch;
    map['modifiedDt'] = _modifiedDt;
    map['modifiedBy'] = _modifiedBy;
    return map;
  }
}
