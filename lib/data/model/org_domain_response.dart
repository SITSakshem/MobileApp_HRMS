import 'package:json_annotation/json_annotation.dart';
part 'org_domain_response.g.dart';

/// messageType : 1
/// error : null
/// message : "dPxhtvI7lXKfxmNiw7zTNhVG5OrPj%2fS0Kp%2f1A1B4%2fkz3Y%2f7c2KvFjtBIm9pa1lCB"
/// returnId : null
/// token : null

@JsonSerializable()
class GetOrgDomainResponse {
  final String? orgCode;
  final String companyName;
  final String message;
  final String messageType;
  final int spmode;


  GetOrgDomainResponse(this.orgCode, this.companyName, this.message, this.messageType, this.spmode);

  factory GetOrgDomainResponse.fromJson(dynamic json) => _$GetOrgDomainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrgDomainResponseToJson(this);

  bool isSuccess() => messageType == 1;
}
