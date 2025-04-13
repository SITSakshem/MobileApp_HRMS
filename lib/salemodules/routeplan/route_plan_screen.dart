
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/routePlanRequest.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';

import '../../../data/remote/result.dart';
import '../../../ui_values/controls_ui.dart';
import '../../../ui_values/space_ui.dart';
import '../../data/model/downline_emp_list.dart';
import '../../data/model/getAllLocationResponse.dart';
import '../../data/model/getNewRoutePlanResponse.dart';
import '../../data/model/getWeekMasterResponse.dart';
import '../../data/model/saveSaleModulRespone.dart';
import '../../data/repository/leave_repository.dart';
import '../../data/repository/routePlanRepository.dart';
import 'RoutePlanListScreen.dart';

class RoutePlanScreen extends StatefulWidget {

  const RoutePlanScreen({super.key});

  @override
  State<RoutePlanScreen> createState() => _RoutePlanScreenState();
}

class _RoutePlanScreenState extends State<RoutePlanScreen> {
  late UserData userData;

  late String routeDate = dateFormatter.format(now);
  DateTime now = DateTime.now();
  DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
  DateTime fromDateDate = DateTime.now();
  DateTime toDateDate = DateTime.now();
  late String fromDate = dateFormatter.format(now);
  late String toDate = dateFormatter.format(now);
  final formKey = GlobalKey<FormState>();

  bool isSubmitPressed = false;
  bool dataLoading = false;

  List<ReturnId> getWeekMaster = [];
  List<RouteReturnId> getRoutePlanMaster = [];
  List<LocationList> getLocationData = [];
  List<RouteRosterDetails> routePlanDetails = [];
  LocationList? selectedLocation;
  num storeLocationID = 0;
  late RoutePlanRequest routePlanRequest;
  late GetWeekMasterResponse getWeekMasterResponse;
  ReturnId? selectedType;
  num weekId = 0;

  List<DateTime> dates=[];
  DateTime? selectedDate;
  var tempDate;
  var dateValue;

  late DateTime startDate;

  late DateTime endDate;

  String selectLocation='Select Location';


  List<String> purposes = [

    'Office Visit',
    'Sales Promotion',
    'Stock Counting',
    'PEN ORDER BOOKING'
    'SALES COLLECTION',
    'NEW PLACEMENT',
    'OFFER SCHEME',
    'OTHERS'
  ];
  List<int> sequenceNos = List<int>.generate(10, (i) => i + 1)..insert(0, 0);

  var selectedPurpose ='Office Visit';
  int selectedSequenceNo = 1;

  Map<dynamic,dynamic> tempMap ={};

  List<DownLineEmp> getDownLineEmpList = [];
  DownLineEmp? selectedDownLineType;
  int downLineEmployeeId = 0;


  @override
  void initState() {
    super.initState();
    userData = MySharedPreference().getUserData();
    _initializeData();

  }
  void getDetailDownLineEmpDetail() async {
    setState(() {
      dataLoading = true;
    });
    var result = await LeaveRepository().getApprentice(userData);
    getDownLineEmpList.add(DownLineEmp.allItem());
    if (result is Success) {
      getDownLineEmpList.addAll(result.data as List<DownLineEmp>);
      selectedDownLineType = getDownLineEmpList.firstOrNull;
    }

    setState(() {
      dataLoading = false;
    });
  }

  Future<List<RouteReturnId>> getRouteData(String tempDate) async {

    var result = await RoutePlanRepository().getRoutePlanApi(userData, tempDate,userData.canManageTeam()?downLineEmployeeId:userData.empId);
    if (result is Success) {
      getRoutePlanMaster=[];
      getRoutePlanMaster = result.data as List<RouteReturnId>;
      print('getRoutePlanMaster=> ${getRoutePlanMaster.length}');
      return getRoutePlanMaster;
    } else {
      debugPrint(result.toString());
      return [];
    }

  }
  Future<void> _initializeData() async {
    DateTime now = DateTime.now();
    debugPrint('week of the year ==> ${weekNumber(now)}');
    _generateDates();
    await getAllLocation();
    await getRouteData(tempDate);
    if (userData.canManageTeam()) {
      getDetailDownLineEmpDetail();
    }
  }
  Future<void> getAllLocation() async {
    var result = await RoutePlanRepository().getAllLocationAPI(userData);
    if (result is Success) {
      setState(() {
        getLocationData = result.data as List<LocationList>;
        selectedLocation = getLocationData.isNotEmpty ? getLocationData[0] : null;
        debugPrint('date==>$getLocationData'); // Or use this date in your Flutter widget
      });
    } else {
      debugPrint(result.toString());
    }
  }

  List<DateTime> getDateRange(DateTime start, DateTime end) {
    List<DateTime> dateList = [];
    for (DateTime date = start; date.isBefore(end) || date.isAtSameMomentAs(end); date = date.add(const Duration(days: 1))) {
      dateList.add(date);
    }
    return dateList;
  }

  int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }

  void _generateDates() {
    DateTime now = DateTime.now();
    for (int i = 0; i <= 5; i++) {
      dates.add(now.add(Duration(days: i)));
    }
    selectedDate=dates[0];
    tempDate=DateFormat('yyyy-MM-dd').format(selectedDate!);
    getAllLocation();
  }
  @override
  Widget build(BuildContext context) {

    List<dynamic> routeDetails = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Plan'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Employee ID & Name'),
              hSpacer(6),
              EmployeeNameWidget("${userData.empCode} - ${userData.empName}"),
              hSpacer(12),
              Visibility(visible: userData.canManageTeam(), child: const FormThemedText('Employee')),
              Visibility(
                  visible: userData.canManageTeam(),
                  child: RoundedBox(
                    height: 52,
                    marginTop: 0,
                    marginBottom: 0,
                    child: DropdownButton<DownLineEmp>(
                      isExpanded: true,
                      value: selectedDownLineType,
                      items: getDownLineEmpList.map((DownLineEmp value) {
                        return DropdownMenuItem<DownLineEmp>(
                          value: value,
                          child: ThemedText(text: value.downLineEmpName.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDownLineType = value;
                          if (value != null) {
                            downLineEmployeeId = value.downLineEmpId;
                          }
                        });
                      },
                    ),
                  )),
              hSpacer(12),
              // Visibility(visible: userData.canManageTeam(), child: const FormThemedText('Route Plan(Select week)')),
              // Visibility(
              //     visible: userData.canManageTeam(),
              //     child: RoundedBox(
              //       height: 52,
              //       marginTop: 0,
              //       marginBottom: 0,
              //       child: DropdownButton<ReturnId>(
              //         isExpanded: true,
              //         value: selectedType,
              //         items: getWeekMaster.map((ReturnId value) {
              //           return DropdownMenuItem<ReturnId>(
              //             value: value,
              //             child: ThemedText(text: value.weekName.toString()),
              //           );
              //         }).toList(),
              //         onChanged: (value) {
              //           setState(() {
              //             selectedType = value;
              //             if (value != null) {
              //               weekId = value.weekId!;
              //               startDate = DateTime.parse(selectedType!.weekStart.toString()); // Example start date
              //               endDate = DateTime.parse(selectedType!.weekEnd.toString());  // Example
              //               dates = getDateRange(startDate, endDate);
              //               debugPrint('date==>${dates.toString()}');
              //             }
              //           });
              //         },
              //       ),
              //     )),
              // hSpacer(12),
              Visibility(visible: userData.canManageTeam(), child: const FormThemedText('Route Plan(Select date)')),
              // Visibility(
              //     visible: userData.canManageTeam(),
              //     child: RoundedBox(
              //       height: 52,
              //       marginTop: 0,
              //       marginBottom: 0,
              //       child: DropdownButton<DateTime>(
              //         isExpanded: true,
              //         value: selectedDate,
              //         items: dates.map((date){
              //           return DropdownMenuItem<DateTime>(
              //             value: date,
              //             child: FormThemedText(DateFormat('dd-MM-yyyy (EEEE)').format(date)),
              //           );
              //         }).toList(),
              //         onChanged: (DateTime? newDate) {
              //           setState(() {
              //             selectedDate = newDate;
              //
              //           });
              //         },
              //       ),
              //     )),
              Visibility(
                visible: userData.canManageTeam(),
                child: RoundedBox(
                  height: 52,
                  marginTop: 0,
                  marginBottom: 0,
                  child: DropdownButton<DateTime>(
                    isExpanded: true,
                    value: selectedDate,
                    items: dates.map((date) {
                      return DropdownMenuItem<DateTime>(
                        value: date,
                        child: Text(DateFormat('dd-MM-yyyy (EEEE)').format(date)),
                      );
                    }).toList(),
                    onChanged: (DateTime? newDate) {
                      setState(() {
                        selectedDate = newDate;
                        tempDate=DateFormat('yyyy-MM-dd').format(selectedDate!);
                        // getAllLocation();
                        // getRouteData(tempDate);
                      });
                    },
                  ),
                ),
              ),
              hSpacer(12),
              const FormThemedText('Store / Location'),
              hSpacer(6),
              RoundedBox(
                height: 52,
                marginTop: 0,
                marginBottom: 0,
                child: DropdownButton<LocationList>(
                  isExpanded: true,
                  value: selectedLocation,
                  items: getLocationData.map((LocationList value) {
                    return DropdownMenuItem<LocationList>(
                      value: value,
                      child: ThemedText(text: value.code.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLocation = value;
                      if (value != null) {
                        storeLocationID = value.locationId!;
                      }
                    });
                  },
                ),
              ),
              hSpacer(12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        FormThemedText('Purposes'),
                        Spacer(), // Spacer to push the sequence label to the right
                        FormThemedText('Sequence'),
                      ],
                    ),
                    hSpacer(6),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true, // Ensures the dropdown expands to the full width
                              value: selectedPurpose,
                              items: purposes.map((String purpose) {
                                return DropdownMenuItem<String>(
                                  value: purpose,
                                  child: Text(
                                    purpose,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedPurpose = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 15), // Horizontal spacer
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: DropdownButton<int>(
                              isExpanded: true, // Ensures the dropdown expands to the full width
                              value: selectedSequenceNo,
                              items: sequenceNos.map((int seqNo) {
                                return DropdownMenuItem<int>(
                                  value: seqNo,
                                  child: Text(
                                    seqNo.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedSequenceNo = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      if (selectedDate != null && selectedPurpose != 'Select Purpose' && selectedLocation!=null) {
                        String key = selectedLocation!.code.toString();

                        tempMap[key] = SelectionItem(
                          locationId: selectedLocation!.locationId!.toInt(),
                          purpose: selectedPurpose,
                          sequenceNo: selectedSequenceNo,
                          locationName: selectedLocation!.code.toString(),
                        );
                        setState(() {
                          debugPrint('tempMap==>${tempMap.values.toString()}');
                          selectedLocation = null;
                        });
                      } else {
                        // Handle the error (e.g., show a message that all fields are required)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('All fields are required!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Text color
                      backgroundColor: Colors.blueGrey, // Background color
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      ),
                    ),
                    child: Text('Add Plan ${tempMap.values.isNotEmpty ? tempMap.values.length : ''}'),
                  ),

                  tempMap.values.isNotEmpty?ElevatedButton(
                    onPressed: () {
                      List<dynamic> routePlanDetails=[];

                      for (var item in tempMap.values) {
                        routePlanDetails.add({
                          "RouteName":item.locationName,
                          "LocationId":item.locationId,
                          "RoutePurpose":item.purpose,
                          "Sequence":item.sequenceNo,

                        });
                        print('RouteName: ${item.locationName}, LocationId: ${item.locationId}, RoutePurpose: ${item.purpose}, Sequence: ${item.sequenceNo}');
                      }
                      if(routePlanDetails!=[]){
                        getStoreItems(routePlanDetails,1);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Text color
                      backgroundColor: Colors.green, // Background color
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      ),
                    ),
                    child: const Text('Save Plan'),
                  ):const SizedBox.shrink(),
                ],
              ),

              hSpacer(12),

              Expanded(
                child: ListView.builder(
                  itemCount: tempMap.length,
                  itemBuilder: (context, index) {
                    String key = tempMap.keys.elementAt(index);
                    SelectionItem item = tempMap[key]!;
                    DateTime createdDate = DateTime.parse(tempDate.toString());
                    String formattedDate = DateFormat('dd-MMM-yyyy (EEEE)').format(createdDate);
                    return Card(
                      child: ListTile(
                        title: Text('$formattedDate \nRoute: ${item.locationName}'),
                        subtitle: Text('Purpose: ${item.purpose} , Sequence: ${item.sequenceNo}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                setState(() {
                                  // Populate the fields with the selected item data
                                  selectedPurpose = item.purpose;
                                  selectedLocation = getLocationData.firstWhere((location) => location.locationId == item.locationId);
                                  selectedSequenceNo = item.sequenceNo;

                                  // Remove the item from the map to edit
                                  tempMap.remove(key);
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  tempMap.remove(key);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Visibility(visible: dataLoading, child: const Center(child: CircularProgressIndicator())),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      getRouteData(tempDate);

                      // List<RouteReturnId> getRoutePlanMaster = await getRouteData(DateFormat('yyyy-MM-dd').format(now));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RoutePlanListScreen(routePlanList: getRoutePlanMaster),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Text color
                      backgroundColor: Colors.blueAccent, // Background color
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      ),
                    ),
                    child: const Text('View Route Plan List'),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  late SaveSaleModulRespone saveRoute;

  void getStoreItems( routeDetails,statusType) async {
    setState(() {
      dataLoading = true;
    });

    var result = await RoutePlanRepository().saveRoutePlanAPI(
      userData,
      tempDate,
      routeDetails,
      downLineEmployeeId,
      statusType
    );

    if (result is Success) {
      // Optionally, show a success message
      saveRoute = result.data ;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(saveRoute.message??'')),
      );
      routeDetails.clear();
      // Navigate back to the previous screen
      Navigator.pop(context);

      // getRouteData(tempDate);
    } else {
      debugPrint(result.toString());

      // Optionally, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit data!')),
      );
    }

    setState(() {
      dataLoading = false;
    });
  }



}

class SelectionItem {
  // final DateTime date;
  // final LocationData location;
  final String purpose;
  final String locationName;
  final int sequenceNo;
  final int locationId;

  SelectionItem({
    // required this.date,
    // required this.location,
    required this.purpose,
    required this.sequenceNo,
    required this.locationName,
    required this.locationId,

  });

  @override
  String toString() {
    return 'SelectionItem(RouteName: $locationName, LocationId: $locationId, RoutePurpose: $purpose, Sequence: $sequenceNo)';
  }
}