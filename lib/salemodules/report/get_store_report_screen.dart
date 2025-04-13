import 'package:flutter/material.dart';
import 'package:hrms/data/repository/SaleReportRepository.dart';
import '../../data/local/my_shared_preference.dart';
import '../../data/local/user_data.dart';
import '../../data/model/storemodule/get_store_report_response.dart';
import '../../data/remote/result.dart';
import '../../ui_values/controls_ui.dart';

class GetStoreReportScreen extends StatefulWidget {
  const GetStoreReportScreen({super.key});

  @override
  State<GetStoreReportScreen> createState() => _GetStoreReportScreenState();
}

class _GetStoreReportScreenState extends State<GetStoreReportScreen> {
  bool dataLoading = false;
  late UserData userData;
  GetStoreList? getLocationList;
  List<GetStoreList> getLocationData = [];
  GetStoreList? selectedType;

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    getAllStoreLocation();
    super.initState();
  }

  void getAllStoreLocation() async {
    setState(() {
      dataLoading = true;
    });
    var result = await SaleReportRepository().getStoreReportAPI(userData);
    if (result is Success) {
      setState(() {
        getLocationData = result.data as List<GetStoreList>;
        getLocationList =
            getLocationData.isNotEmpty ? getLocationData[0] : null;
        debugPrint(
            'date==>$getLocationData'); // Or use this date in your Flutter widget
      });
    } else {
      debugPrint(result.toString());
    }
    setState(() {
      dataLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Store Report'),
        ),
        body: FutureBuilder(
            future: SaleReportRepository().getStoreReportAPI(userData),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: getLocationData.length,
                  itemBuilder: (BuildContext context, int index) {
                    var currentData = getLocationData[index];
                    debugPrint('currentData==>$currentData');
                    return Card(
                      child: Container(
                        height: 240,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(0)),
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(0),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // First Column
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 15.0, 15.0, 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Left side of first column
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customTextView(
                                                context,
                                                'STORE DETAILS',
                                                16,
                                                FontWeight.bold,
                                                Colors.black54),
                                            customTextView(
                                                context,
                                                currentData.name.toString(),
                                                14,
                                                FontWeight.normal,
                                                Colors.black87),
                                            customTextView(
                                                context,
                                                currentData.companyName
                                                    .toString(),
                                                14,
                                                FontWeight.normal,
                                                Colors.green),
                                          ],
                                        ),
                                        // Right side of first column
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              height: 70,
                                              child: Image.asset(
                                                'assets/store.png',
                                                height: 65,
                                                width: 65,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Second Column
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 10.0, 15.0, 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Left side of second column
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customTextView(
                                              context,
                                              'STORE CODE',
                                              12,
                                              FontWeight.bold,
                                              Colors.black54),
                                          customTextView(
                                              context,
                                              currentData.code.toString(),
                                              18,
                                              FontWeight.normal,
                                              Colors.black),
                                        ],
                                      ),
                                      // Right side of second column
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customTextView(context, 'ORDERS', 12,
                                              FontWeight.bold, Colors.black54),
                                          customTextView(
                                              context,
                                              currentData.locationId.toString(),
                                              18,
                                              FontWeight.normal,
                                              Colors.black),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 180,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
