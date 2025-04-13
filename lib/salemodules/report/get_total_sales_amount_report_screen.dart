import 'package:flutter/material.dart';

import '../../data/local/my_shared_preference.dart';
import '../../data/local/user_data.dart';
import '../../data/model/storemodule/get_total_sales_amount_report_response.dart';
import '../../data/remote/result.dart';
import '../../data/repository/SaleReportRepository.dart';
import '../../ui_values/controls_ui.dart';

class GetTotalSalesAmountReportScreen extends StatefulWidget {
  const GetTotalSalesAmountReportScreen({super.key});

  @override
  State<GetTotalSalesAmountReportScreen> createState() =>
      _GetTotalSalesAmountReportScreenState();
}

class _GetTotalSalesAmountReportScreenState
    extends State<GetTotalSalesAmountReportScreen> {
  bool dataLoading = false;
  late UserData userData;
  GetTotalSaleAmountReportList? getTotalSaleAmountReportList;
  List<GetTotalSaleAmountReportList> getTotalSaleAmountReportListData = [];

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    getTotalSaleAmountReport();
    super.initState();
  }

  void getTotalSaleAmountReport() async {
    setState(() {
      dataLoading = true;
    });
    var result = await SaleReportRepository().getTotalSaleAmountReportAPI(userData);
    if (result is Success) {
      setState(() {
        getTotalSaleAmountReportListData = result.data as List<GetTotalSaleAmountReportList>;
        getTotalSaleAmountReportList = getTotalSaleAmountReportListData.isNotEmpty ? getTotalSaleAmountReportListData[0] : null;
        debugPrint('date==>$getTotalSaleAmountReportListData'); // Or use this date in your Flutter widget
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
        title: const Text('Total Sales Amount Report'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: getTotalSaleAmountReportListData.length,
                  itemBuilder: (context, index) {
                    var currentData = getTotalSaleAmountReportListData[index];
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
                                                'TOTAL SALE AMOUNT'.toUpperCase(),
                                                16,
                                                FontWeight.bold,
                                                Colors.black54),
                                            customTextView(
                                                context,
                                                'Quantity',
                                                14,
                                                FontWeight.normal,
                                                Colors.black87),
                                            customTextView(
                                                context,
                                                currentData.qty
                                                    .toString(),
                                                18,
                                                FontWeight.normal,
                                                Colors.black),
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
                                                'assets/profit_up.png',
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
                                              'Total Amount'.toUpperCase(),
                                              12,
                                              FontWeight.bold,
                                              Colors.black54),
                                          customTextView(
                                              context,
                                              "₹ ${currentData.totalAmount.toString()}",
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
                                          customTextView(context, 'Item group name'.toUpperCase(), 12,
                                              FontWeight.bold, Colors.black54),
                                          customTextView(
                                              context,
                                              currentData.itemGroupName.toString(),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 12,
              itemBuilder: (ctx, i) {
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
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('DAILY SALE',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54)),
                                        Text('60',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black87)),
                                        Text('75%',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.green)),
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
                                          child: Image.network(
                                            'https://images.vexels.com/media/users/3/144131/isolated/preview/29576a7e0442960346703d3ecd6bac04-picture-doodle-icon.png',
                                            // Replace with your image URL
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Second Column
                            const Padding(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left side of second column
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('STORE VISIT',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54)),
                                      Text('5',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  // Right side of second column
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('ORDERS',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54)),
                                      Text('32',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
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
            ),
          ),
        ],
      ),
    );
  }



}
