// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_domain_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrgDomainResponse _$GetOrgDomainResponseFromJson(
        Map<String, dynamic> json) =>
    GetOrgDomainResponse(
      json['OrgCode'] as String?,
      json['company_name'] as String,
      json['message'] as String,
      json['messageType'] as String,
      (json['spmode'] as num).toInt(),
    );

Map<String, dynamic> _$GetOrgDomainResponseToJson(
        GetOrgDomainResponse instance) =>
    <String, dynamic>{
      'OrgCode': instance.orgCode,
      'company_name': instance.companyName,
      'message': instance.message,
      'messageType': instance.messageType,
      'spmode': instance.spmode,
    };
