// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<GetOrgDomainResponse> validateOrganization(
      Map<String, String> request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<GetOrgDomainResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://wcf.galway.in/HRMS.svc/GetDomain',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetOrgDomainResponse _value;
    try {
      _value = GetOrgDomainResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> getSalt(String organizationCode) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetSalt/${organizationCode}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<LoginResponse> login(Map<String, String> request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/Login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginResponse _value;
    try {
      _value = LoginResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ValidateUserResponse> validateUser(Map<String, String> request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<ValidateUserResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/Login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ValidateUserResponse _value;
    try {
      _value = ValidateUserResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      Map<String, String> request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<ForgotPasswordResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/ForgotPassword',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ForgotPasswordResponse _value;
    try {
      _value = ForgotPasswordResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<LeaveTypeResponse> getLeaveType(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int empId,
    String userId,
    String userName,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': empId,
      r'UserId': userId,
      r'UserName': userName,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<LeaveTypeResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/LeaveType',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LeaveTypeResponse _value;
    try {
      _value = LeaveTypeResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DownLineEmpResponse> getApprentice(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int empId,
    String userId,
    String userName,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': empId,
      r'UserId': userId,
      r'UserName': userName,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DownLineEmpResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetApprentice',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DownLineEmpResponse _value;
    try {
      _value = DownLineEmpResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<LeaveBalanceResponse> getLeaveBalance(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    int empId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<LeaveBalanceResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/LeaveBalance/${empId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LeaveBalanceResponse _value;
    try {
      _value = LeaveBalanceResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<LeaveApplicationResponse> getLeaveApplication(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String fromDate,
    String toDate,
    bool includePending,
    int downLineEmployeeId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<LeaveApplicationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetLeaveApplication/${fromDate}/${toDate}/${includePending}/${downLineEmployeeId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LeaveApplicationResponse _value;
    try {
      _value = LeaveApplicationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> approveLeave(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int transactionNumber,
    int approvalStatus,
    String approvalRemarks,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/LeaveApproval/${transactionNumber}/${approvalStatus}/${approvalRemarks}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> postLeaveApplication(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String fromDate,
    String toDate,
    int empId,
    int leaveType,
    int applicabilityType,
    String remarks,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'FromDt': fromDate,
      'ToDt': toDate,
      'EmpId': empId,
      'LeaveType': leaveType,
      'ApplicabilityType': applicabilityType,
      'RequestedRemarks': remarks,
    };
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          'api/HRMS/LeaveApplication',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> attendanceApplication(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String inTime,
    String outTime,
    int empId,
    String attendanceDate,
    String remarks,
    String location,
    String file,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      '_InTime',
      inTime,
    ));
    _data.fields.add(MapEntry(
      '_OutTime',
      outTime,
    ));
    _data.fields.add(MapEntry(
      'EmpId',
      empId.toString(),
    ));
    _data.fields.add(MapEntry(
      'AttendanceDt',
      attendanceDate,
    ));
    _data.fields.add(MapEntry(
      'RequestedRemarks',
      remarks,
    ));
    _data.fields.add(MapEntry(
      'location',
      location,
    ));
    _data.fields.add(MapEntry(
      'Documentfile',
      file,
    ));
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'api/HRMS/AttendanceApplication',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> mobilePunch(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int inTime,
    String outTime,
    int empId,
    String description,
    double latitude,
    double longitude,
    File file,
    String addressFromLatLng,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'PunchType',
      inTime.toString(),
    ));
    _data.fields.add(MapEntry(
      'PunchTime',
      outTime,
    ));
    _data.fields.add(MapEntry(
      'EmpId',
      empId.toString(),
    ));
    _data.fields.add(MapEntry(
      'Description',
      description,
    ));
    _data.fields.add(MapEntry(
      'Latitude',
      latitude.toString(),
    ));
    _data.fields.add(MapEntry(
      'Longitude',
      longitude.toString(),
    ));
    _data.files.add(MapEntry(
      'Attachementfile',
      MultipartFile.fromFileSync(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'LocationAddress',
      addressFromLatLng,
    ));
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'api/HRMS/MobilePunch',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AttendanceApplicationResponse> getAttendanceApplication(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String fromDate,
    String toDate,
    bool includePending,
    int downLineEmployeeId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AttendanceApplicationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetAttendanceApplication/${fromDate}/${toDate}/${includePending}/${downLineEmployeeId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AttendanceApplicationResponse _value;
    try {
      _value = AttendanceApplicationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MobilePunchReportResponse> getMobilePunchReport(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String fromDate,
    String toDate,
    int downLineEmployeeId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<MobilePunchReportResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetMobilePunch/${fromDate}/${toDate}/${downLineEmployeeId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MobilePunchReportResponse _value;
    try {
      _value = MobilePunchReportResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> applyCompOff(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String inTime,
    String outTime,
    int empId,
    String attendanceDate,
    String remarks,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      '_InTime': inTime,
      '_OutTime': outTime,
      'EmpId': empId,
      'AttendanceDt': attendanceDate,
      'RequestedRemarks': remarks,
    };
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          'api/HRMS/CompOffRaiseApplication',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AppliedCompOffResponse> getCompOffRaiseApplication(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String fromDate,
    String toDate,
    bool includePending,
    int downLineEmployeeId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AppliedCompOffResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetCompOffRaiseApplication/${fromDate}/${toDate}/${includePending}/${downLineEmployeeId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AppliedCompOffResponse _value;
    try {
      _value = AppliedCompOffResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AvailableCompOffResponse> getEmployeeCompOff(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int empId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AvailableCompOffResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetEmpCompoffDate/${empId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AvailableCompOffResponse _value;
    try {
      _value = AvailableCompOffResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> applyOutdoor(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String inTime,
    String outTime,
    int empId,
    String attendanceDate,
    String remarks,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      '_InTime': inTime,
      '_OutTime': outTime,
      'EmpId': empId,
      'AttendanceDt': attendanceDate,
      'RequestedRemarks': remarks,
    };
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          'api/HRMS/OutdoorApplication',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<OutdoorReportResponse> getOutdoorApplication(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    String fromDate,
    String toDate,
    bool includePending,
    int downLineEmployeeId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<OutdoorReportResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetOutdoorApplication/${fromDate}/${toDate}/${includePending}/${downLineEmployeeId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OutdoorReportResponse _value;
    try {
      _value = OutdoorReportResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse> updateOutdoorRequestStatus(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int transactionNumber,
    int approvalStatus,
    String approvalRemarks,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/OutdoorApproval/${transactionNumber}/${approvalStatus}/${approvalRemarks}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse _value;
    try {
      _value = BaseResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetWeekMasterResponse> getWeekMasterApi(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int weekOfYear,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetWeekMasterResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetWeekMaster/weekOfYear',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetWeekMasterResponse _value;
    try {
      _value = GetWeekMasterResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetNewRoutePlanResponse> getRoutePlanMasterApi(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int empId,
    String weekOfYear,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetNewRoutePlanResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/getRoutePlan/empId/dateOfRoute',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetNewRoutePlanResponse _value;
    try {
      _value = GetNewRoutePlanResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetAllLocationResponse> getLocationApi(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetAllLocationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetLocation/true',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetAllLocationResponse _value;
    try {
      _value = GetAllLocationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetStoreItemResponseNew> getStoreItemApi(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetStoreItemResponseNew>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/GetItemMaster',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetStoreItemResponseNew _value;
    try {
      _value = GetStoreItemResponseNew.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SaveSaleModulRespone> saveStoreSalesBooking(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    Map<String, dynamic> request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<SaveSaleModulRespone>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/SaveStoreSalesBooking',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SaveSaleModulRespone _value;
    try {
      _value = SaveSaleModulRespone.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SaveSaleModulRespone> saveStoreSales(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    Map<String, dynamic> request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<SaveSaleModulRespone>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/SaveStoreSales',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SaveSaleModulRespone _value;
    try {
      _value = SaveSaleModulRespone.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SaveSaleModulRespone> savePurchaseOrder(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    Map<String, dynamic> request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<SaveSaleModulRespone>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/SavePurchaseOrder',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SaveSaleModulRespone _value;
    try {
      _value = SaveSaleModulRespone.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DayAttendanceResponse> getDayStatus(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int empId,
    String fromDate,
    String toDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DayAttendanceResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetDayStatus/${empId}/${fromDate}/${toDate}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DayAttendanceResponse _value;
    try {
      _value = DayAttendanceResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SaveSaleModulRespone> saveRoutePlan(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    Map<String, dynamic> request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<SaveSaleModulRespone>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/SaveRoutePlan',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SaveSaleModulRespone _value;
    try {
      _value = SaveSaleModulRespone.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetStoreReportResponse> getStoreReportApi(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int zoneId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': zoneId,
      r'UserName': userName,
      r'Role': role,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetStoreReportResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/HRMS/GetStoreLocation/{id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetStoreReportResponse _value;
    try {
      _value = GetStoreReportResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetTotalSaleAmountReportResponse> getTotalSalesAmountReportApi(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int zoneId,
    int locationId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
      r'id': locationId,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetTotalSaleAmountReportResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/getTotalSalesAmount/{id/{id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetTotalSaleAmountReportResponse _value;
    try {
      _value = GetTotalSaleAmountReportResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetTotalSaleBookingReportResponse> getTotalSalesBookingReportApi(
    String token,
    String salt,
    int companyId,
    int orgId,
    String orgCode,
    int employeeId,
    String userId,
    String userName,
    String role,
    int zoneId,
    int locationId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Token': token,
      r'Salt': salt,
      r'CompanyId': companyId,
      r'OrgId': orgId,
      r'OrgCode': orgCode,
      r'EmpId': employeeId,
      r'UserId': userId,
      r'UserName': userName,
      r'Role': role,
      r'id': locationId,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetTotalSaleBookingReportResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/Sales/getTotalSalesBooking/{id/{id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetTotalSaleBookingReportResponse _value;
    try {
      _value = GetTotalSaleBookingReportResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
