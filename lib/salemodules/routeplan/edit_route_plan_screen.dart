import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/routePlanRequest.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';

import '../../../data/remote/result.dart';
import '../../../ui_values/controls_ui.dart';
import '../../../ui_values/space_ui.dart';
import '../../data/model/getAllLocationResponse.dart';
import '../../data/model/getNewRoutePlanResponse.dart';
import '../../data/model/getWeekMasterResponse.dart';
import '../../data/model/saveSaleModulRespone.dart';
import '../../data/repository/routePlanRepository.dart';

class EditRoutePlanScreen extends StatefulWidget {
  final List<RouteReturnId> routePlanList;
  final DateTime selectedDate;
  const EditRoutePlanScreen({super.key, required this.routePlanList,required this.selectedDate});

  @override
  State<EditRoutePlanScreen> createState() => _EditRoutePlanScreenState();
}

class _EditRoutePlanScreenState extends State<EditRoutePlanScreen> {
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
    'PRE ORDER BOOKING'
    'SALES COLLECTION',
    'NEW PLACEMENT',
    'OFFER SCHEME',
    'OTHERS'

  ];
  List<int> sequenceNos = List<int>.generate(10, (i) => i + 1)..insert(0, 0);

  var selectedPurpose ='Office Visit';
  int selectedSequenceNo = 1;

  Map<dynamic,dynamic> tempMap ={};

  int downLineEmployeeId = 0;

  String? _editingPurpose;
  int? _editingSequenceNo;
  LocationList? _editingLocation;
  @override
  void initState() {
    selectedDate=widget.selectedDate;
    super.initState();
    userData = MySharedPreference().getUserData();
    _initializeData();

  }

  Future<void> _initializeData() async {
    DateTime now = DateTime.now();
    debugPrint('week of the year ==> ${weekNumber(now)}');
    tempDate=DateFormat('yyyy-MM-dd').format(selectedDate!);
    await getAllLocation();
    getRoutePlanMaster=widget.routePlanList;

    for (var route in widget.routePlanList) {
      String key = route.routePlanDetails![0].routeName.toString();
      // selectedDate = DateTime.parse(route.date.toString());
       downLineEmployeeId=route.empId as int;
      tempMap[key] = SelectionItem(
        locationId: route.routePlanDetails![0].locationId as int,
        purpose: route.routePlanDetails![0].routePurpose.toString(),
        sequenceNo: route.routePlanDetails![0].sequence as int,
        locationName: route.routePlanDetails![0].routeName.toString(),
      );
    }

    // await getRouteData(tempDate);
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


  @override
  Widget build(BuildContext context) {

    List<dynamic> routeDetails = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Route Plan'),
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
              Visibility(visible: userData.canManageTeam(), child: const FormThemedText('Route Plan(Select date)')),
              hSpacer(6),
              EmployeeNameWidget(DateFormat('dd-MM-yyyy (EEEE)').format(selectedDate!)),
              hSpacer(12),
              Visibility(visible: userData.canManageTeam(), child: const FormThemedText('Store / Location')),
              hSpacer(6),
              Visibility(
                visible: userData.canManageTeam(),
                child: RoundedBox(
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
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child:DropdownButton<String>(
                              isExpanded: true,
                              value: selectedPurpose.isNotEmpty ? selectedPurpose : null,
                              items: purposes.map((String purpose) {
                                return DropdownMenuItem<String>(
                                  value: purpose,
                                  child: Text(purpose),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedPurpose = newValue ?? '';
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 15), // Horizontal spacer
                        Expanded(
                          flex: 1,
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
                      if (selectedDate != null && selectedPurpose != 'Select Purpose') {
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
                          selectedPurpose = '';
                          selectedSequenceNo = 1;

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
                        getStoreItems(routePlanDetails);
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
                    DateTime createdDate = DateTime.parse(tempDate);
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
                                  selectedPurpose = item.purpose;
                                  selectedSequenceNo = item.sequenceNo;

                                  // Populate the fields with the selected item data
                                  selectedLocation = getLocationData.firstWhere((location) => location.locationId == item.locationId);

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



            ],
          ),
        ),
      ),
    );
  }

  late SaveSaleModulRespone saveRoute;

  void getStoreItems( routeDetails) async {
    setState(() {
      dataLoading = true;
    });

    var result = await RoutePlanRepository().saveRoutePlanAPI(
      userData,
      tempDate,
      routeDetails,
      userData.canManageTeam()? downLineEmployeeId:userData.empId,
      userData.canManageTeam()?2:2
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
      Navigator.pop(context);
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
  final String purpose;
  final String locationName;
  final int sequenceNo;
  final int locationId;

  SelectionItem({
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