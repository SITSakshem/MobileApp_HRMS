
import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms/data/local/preference_key.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_response.dart';

class MySharedPreference {
  static const _storage = FlutterSecureStorage();
  static const prefFile = "hrms_pref_file";
  final preference = GetStorage(prefFile);

  storeUserData(String token, Login data) async {
    preference.write(PreferenceKey.token, token);
    preference.write(PreferenceKey.empId, data.empId);
    preference.write(PreferenceKey.userId, data.userId);
    preference.write(PreferenceKey.userName, data.userName);
    preference.write(PreferenceKey.companyId, data.companyId);
    preference.write(PreferenceKey.orgId, data.orgId);
    preference.write(PreferenceKey.orgCode, data.orgCode);
    preference.write(PreferenceKey.userRole, data.userRole);
    preference.write(PreferenceKey.salt, data.salt);
    preference.write(PreferenceKey.isMobilePunchApplicable, data.empDetails.attendanceSetting.firstOrNull?.isMobilePunchApplicable ?? false);
    preference.write(PreferenceKey.employeeName, data.empDetails.basicDetails.empName);
    preference.write(PreferenceKey.designation, data.empDetails.basicDetails.desName);
    preference.write(PreferenceKey.department, data.empDetails.basicDetails.departmentName);
    preference.write(PreferenceKey.joiningDate, data.empDetails.basicDetails.joiningDt);
    preference.write(PreferenceKey.empCode, data.empDetails.basicDetails.code);
    preference.write(PreferenceKey.empShiftName, data.empDetails.attendanceSetting.firstOrNull?.shiftName);
    preference.write(PreferenceKey.empWeekoffName, data.empDetails.attendanceSetting.firstOrNull?.weekoffName);
    preference.write(PreferenceKey.empCompany, data.empDetails.basicDetails.companyName);
    preference.write(PreferenceKey.empZone, data.empDetails.basicDetails.zoneName);
    preference.write(PreferenceKey.empLocation, data.empDetails.basicDetails.locationName);
    preference.write(PreferenceKey.empLocationId, data.empDetails.basicDetails.locationId);
    preference.write(PreferenceKey.isLogin, true);
    print(" _userName ${preference.read(PreferenceKey.empLocationId)}");
  }

  resetLogin(bool isLogin) async {
    preference.write(PreferenceKey.isLogin, isLogin);
  }

  bool getIsLogin() {
    return preference.read(PreferenceKey.isLogin) ?? false;
  }

  UserData getUserData() {
    if (getIsLogin()) {
      String name = preference.read(PreferenceKey.employeeName) ?? "";
      int empId = preference.read(PreferenceKey.empId) ?? 0;
      String userId = preference.read(PreferenceKey.userId) ?? "";
      String userName = preference.read(PreferenceKey.userName) ?? "";
      String userRole = preference.read(PreferenceKey.userRole) ?? "";
      String designation = preference.read(PreferenceKey.designation) ?? "";
      String department = preference.read(PreferenceKey.department) ?? "";
      String joiningDate = preference.read(PreferenceKey.joiningDate) ?? "";
      bool isMobilePunchApplicable = preference.read(PreferenceKey.isMobilePunchApplicable) ?? false;
      String token = preference.read(PreferenceKey.token) ?? "";
      String salt = preference.read(PreferenceKey.salt) ?? "";
      int companyId = preference.read(PreferenceKey.companyId) ?? 0;
      int orgId = preference.read(PreferenceKey.orgId) ?? 0;
      String orgCode = preference.read(PreferenceKey.orgCode) ?? "";
      String empCode = preference.read(PreferenceKey.empCode) ?? "";
      String empShiftName = preference.read(PreferenceKey.empShiftName) ?? "";
      String empWeekoffName = preference.read(PreferenceKey.empWeekoffName) ?? "";
      String empCompany = preference.read(PreferenceKey.empCompany) ?? "";
      String empZone = preference.read(PreferenceKey.empZone) ?? "";
      String empLocation = preference.read(PreferenceKey.empLocation) ?? "";
      int empLocationID = preference.read(PreferenceKey.empLocationId) ?? 0;

      return UserData(
          empId: empId, empName: name, userId: userId, userName: userName, token: token, orgId: orgId, orgCode: orgCode,
          userRole: userRole, companyId: companyId, salt: salt, designation: designation, department: department,
          joiningDate: joiningDate, isMobilePunchApplicable: isMobilePunchApplicable, empCode: empCode, empShiftName: empShiftName,
          empWeekoffName: empWeekoffName, empCompany: empCompany, empZone: empZone, empLocation: empLocation,empLocationID: empLocationID);
    } else {
      return UserData();
    }
  }

// Save login credentials
  static Future<void> saveCredentials(String username, String password) async {
    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'password', value: password);
  }

  // Clear login credentials
  static Future<void> clearCredentials() async {
    await _storage.delete(key: 'username');
    await _storage.delete(key: 'password');
  }

  // Retrieve stored credentials (if needed)
  static Future<Map<String, String?>> getCredentials() async {
    String? username = await _storage.read(key: 'username');
    String? password = await _storage.read(key: 'password');
    return {'username': username, 'password': password};
  }


  // Save saveCompanyCode
  static Future<void> saveCompanyCode(String companyCode) async {
    await _storage.write(key: 'companyCode', value: companyCode);
  }

  // Clear clearCompanyCode
  static Future<void> clearCompanyCode() async {
    await _storage.delete(key: 'companyCode');
  }

  // Retrieve stored getCompanyCode
  static Future<Map<String, String?>> getCompanyCode() async {
    String? companyCode = await _storage.read(key: 'companyCode');
    return {'companyCode': companyCode};
  }

  // Save saveCompanyCode
  static Future<void> saveCompanyName(String companyName) async {
    await _storage.write(key: 'companyName', value: companyName);
  }

  // Clear clearCompanyCode
  static Future<void> clearCompanyName() async {
    await _storage.delete(key: 'companyName');
  }

  // Retrieve stored getCompanyCode
  static Future<Map<String, String?>> getCompanyName() async {
    String? companyName = await _storage.read(key: 'companyName');
    return {'companyName': companyName};
  }

  // Save saveUserNameCode
  static Future<void> saveUserNameCode(String userNameCode) async {
    await _storage.write(key: 'userNameCode', value: userNameCode);
  }

  // Clear clearUserNameCode()
  static Future<void> clearUserNameCode() async {
    await _storage.delete(key: 'userNameCode');
  }

  // Retrieve stored getUserNameCode
  static Future<Map<String, String?>> getUserNameCode() async {
    String? userNameCode = await _storage.read(key: 'userNameCode');
    return {'userNameCode': userNameCode};
  }

}
