import 'package:hrms/data/model/base_response.dart';
import 'package:hrms/data/model/forgot_password_response.dart';
import 'package:hrms/data/model/org_domain_response.dart';
import 'package:hrms/data/remote/network_values.dart';
import 'package:hrms/data/remote/result.dart';
import 'package:hrms/data/repository/base_repository.dart';

import '../model/login_response.dart';
import '../model/user_validate_response.dart';

class AuthRepository extends BaseRepository {


  /*Future<Result> getOrgDomain(String orgCode) async {
    try {
      GetOrgDomainResponse response = await client.getOrgDomain(orgCode);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }*/


  Future<Result> validateOrganization(String orgCode, String spMode) async {
    try {
      var request = {'OrgCode': orgCode, 'spmode': spMode };
      GetOrgDomainResponse response = await client.validateOrganization(request);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getSalt(String orgCode) async {
    try {
      BaseResponse response = await client.getSalt(orgCode);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> login(String username, String password, String token, String orgCode) async {
    try {
      var request = {NetworkValues.TOKEN: token, 'Key': NetworkValues.API_KEY, 'OrgCode': orgCode, 'UserName': username, 'Password': password};
      LoginResponse response = await client.login(request);
      if (response.data != null) {
        return Success(response.data);
      } else {
        return Failure(response.message);
      }
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }




  Future<Result> validateUserName(String username, String password, String token, String orgCode) async {
    try {
      var request = {NetworkValues.TOKEN: token, 'Key': NetworkValues.API_KEY, 'OrgCode': orgCode, 'UserName': username, 'Password': password, 'uservalId': "1"};
      ValidateUserResponse response = await client.validateUser(request);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> forgotPassword(String username, String orgCode) async {
    try {
      var request = {'UserName': username, 'OrgCode': orgCode};
      ForgotPasswordResponse response = await client.forgotPassword(request);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

}

