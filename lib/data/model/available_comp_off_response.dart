
import 'package:json_annotation/json_annotation.dart';
part 'available_comp_off_response.g.dart';

@JsonSerializable()
class AvailableCompOffResponse {
  int messageType;
  String? error;
  String message;
  @JsonKey(name: "returnId")
  List<AvailableCompOff> data;
  String? token;

  AvailableCompOffResponse({
    required this.messageType,
    required this.error,
    required this.message,
    required this.data,
    required this.token,
  });

  static AvailableCompOffResponse fromJson(Map<String, dynamic> json) => _$AvailableCompOffResponseFromJson(json);

}

@JsonSerializable()
class AvailableCompOff {
  int empId;
  String attendanceDt;
  @JsonKey(name: "_InTime")
  String inTime;
  @JsonKey(name: "_OutTime")
  String outTime;

  AvailableCompOff({
    required this.empId,
    required this.attendanceDt,
    required this.inTime,
    required this.outTime,
  });

  static AvailableCompOff fromJson(Map<String, dynamic> json) => _$AvailableCompOffFromJson(json);

}
