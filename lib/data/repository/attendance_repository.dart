import 'dart:io';

import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/attendance_application_response.dart';

import 'package:hrms/data/model/mobile_punch_report_response.dart';

import 'package:hrms/data/model/day_attendance_response.dart';


import '../model/base_response.dart';
import '../remote/result.dart';
import 'base_repository.dart';

class AttendanceRepository extends BaseRepository {


  Future<Result> getAttendanceApplication(UserData data, String fromDate, String toDate, bool includePending, int downLineEmployeeId) async {
    try {
      AttendanceApplicationResponse response = await client.getAttendanceApplication(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, fromDate, toDate, includePending, downLineEmployeeId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getMobilePunchReport(UserData data, String fromDate, String toDate, int downLineEmployeeId) async {
    try {
      MobilePunchReportResponse response = await client.getMobilePunchReport(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, fromDate, toDate, downLineEmployeeId);
      return Success(response.data);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> attendanceApplication(UserData data, String inTime, String outTime, String date, String remark, String file, String location) async {
    try {
      BaseResponse response = await client.attendanceApplication(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, inTime, outTime, data.empId, date,
           remark, location, "file");
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> mobilePunch(UserData data, int punchType, String punchTime, double latitude, double longitude, File file, String description, String addressFromLatLng) async {
    try {
      BaseResponse response = await client.mobilePunch(data.token, data.salt, data.companyId, data.orgId,
          data.orgCode, data.empId, data.userId, data.userName, data.userRole, punchType, punchTime, data.empId, description,
           latitude, longitude, file, addressFromLatLng);
      return Success(response);
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }

  Future<Result> getDayAttendance(UserData data, String fromDate, String toDate) async {
    try {
      DayAttendanceResponse response = await client.getDayStatus(data.token, data.salt, data.companyId, data.orgId, data.orgCode, data.empId,
          data.userId, data.userName, data.userRole, data.empId, fromDate, toDate);
      if (response.data != null) {
        return Success(response.data);
      } else {
        return Failure(response.message);
      }
    } catch (error) {
      return Failure(getErrorMessage(error));
    }
  }
}