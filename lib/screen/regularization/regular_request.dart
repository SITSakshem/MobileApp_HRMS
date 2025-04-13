import 'package:flutter/material.dart';
import 'package:hrms/common/hexColor.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:intl/intl.dart';

import '../../ui_values/controls_ui.dart';
import '../../ui_values/employee_name_widget.dart';
import '../../ui_values/space_ui.dart';

class RegularRequestScreen extends StatefulWidget {
  const RegularRequestScreen({super.key});

  @override
  State<RegularRequestScreen> createState() => _RegularRequestScreenState();
}

class _RegularRequestScreenState extends State<RegularRequestScreen> {
  late UserData userData;
  String? leaveType = 'Casual Leave';
  String? leaveDay;
  int? leaveCount;
  TextEditingController leaveValue = TextEditingController();
  bool isSubmit = false;
  String? fromDate;
  String? toDate;
  String? showFromDate;
  String? showToDate;
  DateTime now = DateTime.now();

  DateTime? fromDateDate = DateTime.now();
  DateTime? toDateDate = DateTime.now();
  DateFormat dt = DateFormat('dd-MM-yyyy');
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userData = MySharedPreference().getUserData();

    String? monthValue = (now.month.toString().length == 1) ? ('0${now.month.toString()}') : (now.month.toString());
    String? dayValue = (now.day.toString().length == 1) ? ('0${now.day.toString()}') : (now.day.toString());

    String formattedDate = "${now.year}-$monthValue-$dayValue";
    fromDate = formattedDate;
    toDate = formattedDate;
    String showFormattedDate = "${now.day}-${now.month}-${now.year}";
    showFromDate = showFormattedDate;
    showToDate = showFormattedDate;
    fromDateDate = dt.parse(fromDate ?? '');
    toDateDate = dt.parse(toDate ?? '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regularization Request'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                const FormThemedText('Regularize Date'),
                InkWell(
                  onTap: () {
                    /**
                     *
                     * open date picker
                     */
                    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(now.year), lastDate: DateTime(now.year + 1))
                        .then((value) {
                      setState(() {
                        fromDateDate = dt.parse(value.toString());
                        String? monthValue =
                            (value?.month.toString().length == 1) ? ('0${value?.month.toString() ?? ''}') : (value?.month.toString());
                        String? dayValue = (value?.day.toString().length == 1) ? ('0${value?.day.toString() ?? ''}') : (value?.day.toString());
                        String formattedDate = '${value!.year}-${monthValue ?? ''}-${dayValue ?? ''}';
                        showFromDate = '${dayValue ?? ''}-${monthValue ?? ''}-${value.year}';

                        fromDate = formattedDate;
                      });
                    });
                  },
                  child: RoundedBox(
                      height: 42,
                      child: Row(
                        children: [ThemedText(text: showFromDate.toString()), const Spacer(), const Icon(Icons.calendar_today)],
                      )),
                ),
                hSpacer(12),
                isSubmit
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Visibility(
                        visible: !apiCalling,
                        child: InkWell(
                          onTap: () {
                            if (fromDateDate!.isBefore(toDateDate!)) {
                              getRegularizeData();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select valid date')));
                            }
                          },
                          child: RoundedContainer(
                              height: 38,
                              containerBGColor: HexColor('#72A8D4'),
                              child: const Center(
                                  child: Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ))),
                        ),
                      ),
                hSpacer(12),
                Visibility(
                    visible: apiCalling,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openBottomSheet() {
    String inTime = '00:00';
    String outTime = '00:00';
    leaveValue.text = '';

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            key: const Key('bottomSheet'),
            // appBar: AppBar(
            //   leading: const SizedBox(),
            //   title: Text('For Date '+showFromDate.toString()),
            // ),
            body: SingleChildScrollView(
              child: StatefulBuilder(builder: (BuildContext context, StateSetter setModalState /*You can rename this!*/) {
                return Container(
                  height: 360,
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.close),
                          )
                        ],
                      ),
                      const FormThemedText('New In Time'),
                      InkWell(
                        onTap: () {
                          /**
                               * open time picker
                               */
                          showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                            setModalState(() {
                              String? hourValue =
                                  (value?.hour.toString().length == 1) ? ('0${value?.hour.toString() ?? ''}') : (value?.hour.toString());
                              String? minuteValue =
                                  (value?.minute.toString().length == 1) ? ('0${value?.minute.toString() ?? ''}') : (value?.minute.toString());
                              String formattedDate = '$hourValue:$minuteValue:00';
                              inTime = formattedDate;
                              print(inTime);
                            });
                          });
                        },
                        child: RoundedBox(
                            height: 42,
                            child: Row(
                              children: [ThemedText(text: inTime.toString()), const Spacer(), const Icon(Icons.access_time)],
                            )),
                      ),
                      hSpacer(12),
                      const FormThemedText('New Out Time'),
                      InkWell(
                        onTap: () {
                          /**
                               * open time picker
                               */
                          showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                            setModalState(() {
                              String? hourValue =
                                  (value?.hour.toString().length == 1) ? ('0${value?.hour.toString() ?? ''}') : (value?.hour.toString());
                              String? minuteValue =
                                  (value?.minute.toString().length == 1) ? ('0${value?.minute.toString() ?? ''}') : (value?.minute.toString());
                              String formattedDate = '$hourValue:$minuteValue:00';
                              outTime = formattedDate;
                            });
                          });
                        },
                        child: RoundedBox(
                            height: 42,
                            child: Row(
                              children: [ThemedText(text: outTime.toString()), const Spacer(), const Icon(Icons.access_time)],
                            )),
                      ),
                      hSpacer(12),
                      //Text('Remarks'),
                      TextFormField(
                        maxLines: 3,
                        controller: leaveValue,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter remarks';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Remarks',
                          labelStyle: TextStyle(color: HexColor('#72A8D4')),
                          //hintText: 'Enter Your Name',
                        ),
                      ),
                      hSpacer(12),
                      isSubmit
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : InkWell(
                              onTap: () {
                                if (leaveValue.text.isEmpty || inTime == '00:00' || outTime == '00:00') {
                                  /**
                                 * show snackbar in bottomsheet
                                 */

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(behavior: SnackBarBehavior.floating, content: Text('Must enter Remarks and In/Out Time')));

                                  return;
                                }
                                Navigator.of(context).pop();
                                checkForDuplicateLeave(inTime, outTime, leaveValue.text.toString());
                              },
                              child: RoundedContainer(
                                  height: 38,
                                  containerBGColor: HexColor('#72A8D4'),
                                  child: const Center(
                                      child: Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                            )
                    ],
                  ),
                );
              }),
            ),
          );
        });
  }

  void getRegularizeData() async {
    openBottomSheet();
  }

  bool apiCalling = false;

  void checkForDuplicateLeave(String inTime, String outTime, String reason) async {}

  void regularRequest(String inTime, String outTime, String reason) async {
    DateTime date1 = DateTime(fromDateDate!.year, fromDateDate!.month, fromDateDate!.day);
    DateTime date2 = DateTime(toDateDate!.year, toDateDate!.month, toDateDate!.day);
    int leaveCount = date2.difference(date1).inDays;

    leaveCount = date1 == date2 ? 1 : leaveCount;
    print(leaveCount.toString());
  }
}
