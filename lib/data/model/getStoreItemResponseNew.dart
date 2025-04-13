import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// messageType : 1
/// error : null
/// message : "Data Loaded"
/// returnId : [{"itemLogId":0,"itemId":3,"code":"sh03","name":"Panchvati shampoo","itemGroupId":2,"groupName":"Haircare","description":"test","isActive":true,"itemRate":[{"sno":0,"itemLogId":0,"itemId":3,"rateId":3,"rateLogId":0,"rate":123,"isActive":true,"effectiveFromDt":"2024-05-09T00:00:00","effectiveToDt":"2024-08-31T00:00:00","onAllCompany":true,"onAllZone":true,"onAllLocation":true,"createdDt":"2024-06-12T23:00:46.1067951+05:30"}],"itemMinQty":[{"sno":0,"itemLogId":0,"itemId":3,"minQtyId":3,"minQtyLogId":0,"qty":12,"isActive":true,"effectiveDt":"2024-05-10T00:00:00","onAllCompany":true,"onAllZone":true,"onAllLocation":true,"createdDt":"2024-06-12T23:00:46.1014622+05:30"}],"modifiedBy":null,"modifiedDt":"2024-06-13T04:30:46.1004419+05:30"}]
/// token : null

class GetStoreItemResponseNew {
  GetStoreItemResponseNew({
      int? messageType, 
      dynamic error, 
      String? message, 
      List<StoreItemData>? data,
      dynamic token,}){
    _messageType = messageType;
    _error = error;
    _message = message;
    _data = data;
    _token = token;
}

  GetStoreItemResponseNew.fromJson(dynamic json) {
    _messageType = json['messageType'];
    _error = json['error'];
    _message = json['message'];
    if (json['returnId'] != null) {
      _data = [];
      json['returnId'].forEach((v) {
        _data?.add(StoreItemData.fromJson(v));
      });
    }
    _token = json['token'];
  }
  int? _messageType;
  dynamic _error;
  String? _message;
  List<StoreItemData>? _data;
  dynamic _token;

  int? get messageType => _messageType;
  dynamic get error => _error;
  String? get message => _message;
  List<StoreItemData>? get data => _data;
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

/// itemLogId : 0
/// itemId : 3
/// code : "sh03"
/// name : "Panchvati shampoo"
/// itemGroupId : 2
/// groupName : "Haircare"
/// description : "test"
/// isActive : true
/// itemRate : [{"sno":0,"itemLogId":0,"itemId":3,"rateId":3,"rateLogId":0,"rate":123,"isActive":true,"effectiveFromDt":"2024-05-09T00:00:00","effectiveToDt":"2024-08-31T00:00:00","onAllCompany":true,"onAllZone":true,"onAllLocation":true,"createdDt":"2024-06-12T23:00:46.1067951+05:30"}]
/// itemMinQty : [{"sno":0,"itemLogId":0,"itemId":3,"minQtyId":3,"minQtyLogId":0,"qty":12,"isActive":true,"effectiveDt":"2024-05-10T00:00:00","onAllCompany":true,"onAllZone":true,"onAllLocation":true,"createdDt":"2024-06-12T23:00:46.1014622+05:30"}]
/// modifiedBy : null
/// modifiedDt : "2024-06-13T04:30:46.1004419+05:30"

class StoreItemData {
  StoreItemData({
      int? itemLogId, 
      int? itemId, 
      String? code, 
      String? name, 
      int? itemGroupId, 
      String? groupName, 
      String? description, 
      bool? isActive, 
      List<ItemRate>? itemRate, 
      List<ItemMinQty>? itemMinQty, 
      dynamic modifiedBy, 
      String? modifiedDt,}){
    _itemLogId = itemLogId;
    _itemId = itemId;
    _code = code;
    _name = name;
    _itemGroupId = itemGroupId;
    _groupName = groupName;
    _description = description;
    _isActive = isActive;
    _itemRate = itemRate;
    _itemMinQty = itemMinQty;
    _modifiedBy = modifiedBy;
    _modifiedDt = modifiedDt;

}

  StoreItemData.fromJson(dynamic json) {
    _itemLogId = json['itemLogId'];
    _itemId = json['itemId'];
    _code = json['code'];
    _name = json['name'];
    _itemGroupId = json['itemGroupId'];
    _groupName = json['groupName'];
    _description = json['description'];
    _isActive = json['isActive'];
    if (json['itemRate'] != null) {
      _itemRate = [];
      json['itemRate'].forEach((v) {
        _itemRate?.add(ItemRate.fromJson(v));
      });
    }
    if (json['itemMinQty'] != null) {
      _itemMinQty = [];
      json['itemMinQty'].forEach((v) {
        _itemMinQty?.add(ItemMinQty.fromJson(v));
      });
    }
    _modifiedBy = json['modifiedBy'];
    _modifiedDt = json['modifiedDt'];
  }
  int? _itemLogId;
  int? _itemId;
  String? _code;
  String? _name;
  int? _itemGroupId;
  String? _groupName;
  String? _description;
  bool? _isActive;
  List<ItemRate>? _itemRate;
  List<ItemMinQty>? _itemMinQty;
  dynamic _modifiedBy;
  String? _modifiedDt;
  RxBool isAdded= false.obs;
  RxInt quantity= 0.obs;
  RxInt price= 0.obs;

  int? get itemLogId => _itemLogId;
  int? get itemId => _itemId;
  String? get code => _code;
  String? get name => _name;
  int? get itemGroupId => _itemGroupId;
  String? get groupName => _groupName;
  String? get description => _description;
  bool? get isActive => _isActive;
  List<ItemRate>? get itemRate => _itemRate;
  List<ItemMinQty>? get itemMinQty => _itemMinQty;
  dynamic get modifiedBy => _modifiedBy;
  String? get modifiedDt => _modifiedDt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemLogId'] = _itemLogId;
    map['itemId'] = _itemId;
    map['code'] = _code;
    map['name'] = _name;
    map['itemGroupId'] = _itemGroupId;
    map['groupName'] = _groupName;
    map['description'] = _description;
    map['isActive'] = _isActive;
    if (_itemRate != null) {
      map['itemRate'] = _itemRate?.map((v) => v.toJson()).toList();
    }
    if (_itemMinQty != null) {
      map['itemMinQty'] = _itemMinQty?.map((v) => v.toJson()).toList();
    }
    map['modifiedBy'] = _modifiedBy;
    map['modifiedDt'] = _modifiedDt;
    return map;
  }

}

/// sno : 0
/// itemLogId : 0
/// itemId : 3
/// minQtyId : 3
/// minQtyLogId : 0
/// qty : 12
/// isActive : true
/// effectiveDt : "2024-05-10T00:00:00"
/// onAllCompany : true
/// onAllZone : true
/// onAllLocation : true
/// createdDt : "2024-06-12T23:00:46.1014622+05:30"

class ItemMinQty {
  ItemMinQty({
      int? sno, 
      int? itemLogId, 
      int? itemId, 
      int? minQtyId, 
      int? minQtyLogId, 
      int? qty, 
      bool? isActive, 
      String? effectiveDt, 
      bool? onAllCompany, 
      bool? onAllZone, 
      bool? onAllLocation, 
      String? createdDt,}){
    _sno = sno;
    _itemLogId = itemLogId;
    _itemId = itemId;
    _minQtyId = minQtyId;
    _minQtyLogId = minQtyLogId;
    _qty = qty;
    _isActive = isActive;
    _effectiveDt = effectiveDt;
    _onAllCompany = onAllCompany;
    _onAllZone = onAllZone;
    _onAllLocation = onAllLocation;
    _createdDt = createdDt;
}

  ItemMinQty.fromJson(dynamic json) {
    _sno = json['sno'];
    _itemLogId = json['itemLogId'];
    _itemId = json['itemId'];
    _minQtyId = json['minQtyId'];
    _minQtyLogId = json['minQtyLogId'];
    _qty = json['qty'];
    _isActive = json['isActive'];
    _effectiveDt = json['effectiveDt'];
    _onAllCompany = json['onAllCompany'];
    _onAllZone = json['onAllZone'];
    _onAllLocation = json['onAllLocation'];
    _createdDt = json['createdDt'];
  }
  int? _sno;
  int? _itemLogId;
  int? _itemId;
  int? _minQtyId;
  int? _minQtyLogId;
  int? _qty;
  bool? _isActive;
  String? _effectiveDt;
  bool? _onAllCompany;
  bool? _onAllZone;
  bool? _onAllLocation;
  String? _createdDt;

  int? get sno => _sno;
  int? get itemLogId => _itemLogId;
  int? get itemId => _itemId;
  int? get minQtyId => _minQtyId;
  int? get minQtyLogId => _minQtyLogId;
  int? get qty => _qty;
  bool? get isActive => _isActive;
  String? get effectiveDt => _effectiveDt;
  bool? get onAllCompany => _onAllCompany;
  bool? get onAllZone => _onAllZone;
  bool? get onAllLocation => _onAllLocation;
  String? get createdDt => _createdDt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sno'] = _sno;
    map['itemLogId'] = _itemLogId;
    map['itemId'] = _itemId;
    map['minQtyId'] = _minQtyId;
    map['minQtyLogId'] = _minQtyLogId;
    map['qty'] = _qty;
    map['isActive'] = _isActive;
    map['effectiveDt'] = _effectiveDt;
    map['onAllCompany'] = _onAllCompany;
    map['onAllZone'] = _onAllZone;
    map['onAllLocation'] = _onAllLocation;
    map['createdDt'] = _createdDt;
    return map;
  }

}

/// sno : 0
/// itemLogId : 0
/// itemId : 3
/// rateId : 3
/// rateLogId : 0
/// rate : 123
/// isActive : true
/// effectiveFromDt : "2024-05-09T00:00:00"
/// effectiveToDt : "2024-08-31T00:00:00"
/// onAllCompany : true
/// onAllZone : true
/// onAllLocation : true
/// createdDt : "2024-06-12T23:00:46.1067951+05:30"

class ItemRate {
  ItemRate({
      int? sno, 
      int? itemLogId, 
      int? itemId, 
      int? rateId, 
      int? rateLogId, 
      int? rate, 
      bool? isActive, 
      String? effectiveFromDt, 
      String? effectiveToDt, 
      bool? onAllCompany, 
      bool? onAllZone, 
      bool? onAllLocation, 
      String? createdDt,}){
    _sno = sno;
    _itemLogId = itemLogId;
    _itemId = itemId;
    _rateId = rateId;
    _rateLogId = rateLogId;
    _rate = rate;
    _isActive = isActive;
    _effectiveFromDt = effectiveFromDt;
    _effectiveToDt = effectiveToDt;
    _onAllCompany = onAllCompany;
    _onAllZone = onAllZone;
    _onAllLocation = onAllLocation;
    _createdDt = createdDt;
}

  ItemRate.fromJson(dynamic json) {
    _sno = json['sno'];
    _itemLogId = json['itemLogId'];
    _itemId = json['itemId'];
    _rateId = json['rateId'];
    _rateLogId = json['rateLogId'];
    _rate = json['rate'];
    _isActive = json['isActive'];
    _effectiveFromDt = json['effectiveFromDt'];
    _effectiveToDt = json['effectiveToDt'];
    _onAllCompany = json['onAllCompany'];
    _onAllZone = json['onAllZone'];
    _onAllLocation = json['onAllLocation'];
    _createdDt = json['createdDt'];
  }
  int? _sno;
  int? _itemLogId;
  int? _itemId;
  int? _rateId;
  int? _rateLogId;
  int? _rate;
  bool? _isActive;
  String? _effectiveFromDt;
  String? _effectiveToDt;
  bool? _onAllCompany;
  bool? _onAllZone;
  bool? _onAllLocation;
  String? _createdDt;


  int? get sno => _sno;
  int? get itemLogId => _itemLogId;
  int? get itemId => _itemId;
  int? get rateId => _rateId;
  int? get rateLogId => _rateLogId;
  int? get rate => _rate;
  bool? get isActive => _isActive;
  String? get effectiveFromDt => _effectiveFromDt;
  String? get effectiveToDt => _effectiveToDt;
  bool? get onAllCompany => _onAllCompany;
  bool? get onAllZone => _onAllZone;
  bool? get onAllLocation => _onAllLocation;
  String? get createdDt => _createdDt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sno'] = _sno;
    map['itemLogId'] = _itemLogId;
    map['itemId'] = _itemId;
    map['rateId'] = _rateId;
    map['rateLogId'] = _rateLogId;
    map['rate'] = _rate;
    map['isActive'] = _isActive;
    map['effectiveFromDt'] = _effectiveFromDt;
    map['effectiveToDt'] = _effectiveToDt;
    map['onAllCompany'] = _onAllCompany;
    map['onAllZone'] = _onAllZone;
    map['onAllLocation'] = _onAllLocation;
    map['createdDt'] = _createdDt;
    return map;
  }

}