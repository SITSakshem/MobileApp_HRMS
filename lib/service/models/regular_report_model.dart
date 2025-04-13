
class RegularReportModel {
  List<RegularReportModelData>? data;

  RegularReportModel({this.data});

  factory RegularReportModel.fromJson(Map<String,dynamic> json) {
    List<RegularReportModelData> data = [];
    if (json != null) {
      for (int i = 0; i < json.length; i++) {
        data.add(RegularReportModelData.fromJson(json[i]));
      }
    }
    return RegularReportModel(
      data: data,
    );
  }
}


class RegularReportModelData{

/**
 * create model for the response
 */
String? empCode;
String? eName;
String? shift;
String? forDate;
String? appDate;
String? inTime;
String? outTime;
String? appNo;
String? dept;
String? remarks;
String? status;
bool? isSelected;


RegularReportModelData({this.empCode, this.eName, this.shift, this.forDate, this.appDate, this.inTime, this.outTime, this.appNo, this.dept, this.remarks, this.status, this.isSelected});

RegularReportModelData.fromJson(Map<String, dynamic> json) {
empCode = json['EmpCode'].toString();
eName = json['EName'].toString();
shift = json['Shift'].toString();
forDate = json['ForDate'].toString();
appDate = json['AppDate'].toString();
inTime = json['InTime'].toString();
outTime = json['OutTime'].toString();
appNo = json['AppNo'].toString();
dept = json['Dept'].toString();
remarks = json['Remarks'].toString();
status = json['Status'].toString();
isSelected = false;

}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['EmpCode'] = this.empCode;
data['EName'] = this.eName;
data['Shift'] = this.shift;
data['ForDate'] = this.forDate;
data['AppDate'] = this.appDate;
data['InTime'] = this.inTime;
data['OutTime'] = this.outTime;
data['AppNo'] = this.appNo;
data['Dept'] = this.dept;
data['Remarks'] = this.remarks;
data['Status'] = this.status;
data['isSelected'] = this.isSelected??false;
return data;
}

}