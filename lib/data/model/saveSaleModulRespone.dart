/// messageType : 1
/// error : null
/// message : "Save Successfully"
/// returnId : null
/// token : null

class SaveSaleModulRespone {
  SaveSaleModulRespone({
      int? messageType, 
      dynamic error,
      dynamic message,
      dynamic returnId, 
      dynamic token,}){
    _messageType = messageType;
    _error = error;
    _message = message;
    _returnId = returnId;
    _token = token;
}

  SaveSaleModulRespone.fromJson(dynamic json) {
    _messageType = json['messageType'];
    _error = json['error'];
    _message = json['message'];
    _returnId = json['returnId'];
    _token = json['token'];
  }
  int? _messageType;
  dynamic _error;
  dynamic _message;
  dynamic _returnId;
  dynamic _token;

  int? get messageType => _messageType;
  dynamic get error => _error;
  dynamic get message => _message;
  dynamic get returnId => _returnId;
  dynamic get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messageType'] = _messageType;
    map['error'] = _error;
    map['message'] = _message;
    map['returnId'] = _returnId;
    map['token'] = _token;
    return map;
  }

}