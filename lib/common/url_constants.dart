

const String oldEndPoint='http://13.235.10.10:8888/';
const String endPoint='http://qa.ourhrms.com/';
//const String userSaltUrl='api/HRMS/GetSalt/MB';
const String userSaltUrl='api/HRMS/GetSalt/AH';
const String oldLoginUrl="api/UserManage/Login";
const String loginUrl="api/HRMS/Login";
const String empDetailUrl="api/Employee/GetEmployeeProfile?";
const String leaveUrl="api/EmployeeLeaves/getEmployeeLeave";
const String leaveRequestUrl="api/EmployeeLeaves/LeaveApply";
const String leaveReportUrl="api/EmployeeLeaves/PreviousLeaves";
const String leaveForRecommend="api/EmployeeLeaves/ListOfLeaveForRecommendation";
const String leaveForApproval="api/EmployeeLeaves/ListOfLeaveForApproval";
const String leaveCancelUrl="api/EmployeeLeaves/Leavecancel";
const String leaveRecommendUrl="api/EmployeeLeaves/LeaveRecommend";
const String leaveApprovalUrl="api/EmployeeLeaves/LeaveApproval";
const String checkDuplicateLeaveUrl="api/EmployeeLeaves/CheckForDuplicateLeaveEntryInRange";

const String regularizeDataUrl="api/Attendance/GetEmployeeAttendance";
const String checkDuplicateRegularUrl="api/Attendance/CheckForDuplicateManual";
const String submitRegularizeUrl="api/Attendance/AttendanceManual";
const String leaveRegularReportUrl="api/Attendance/PreviousRegularizationApplied";
const String regularCancelUrl="api/Attendance/RecommendAttendanceRegularization";
const String regularForRecommend="api/Attendance/ListOfRegularizationRequest";
const String regularForApproval="api/Attendance/ListOfRegularizationApproval";
const String submitRegularForRecommend="api/Attendance/RecommendAttendanceRegularization";
const String submitRegularForApproval="api/Attendance/ApproveAttendanceRegularization";
const String submitGeoFenceAttendance="api/Attendance/ValidateGeoFenceAttendance";