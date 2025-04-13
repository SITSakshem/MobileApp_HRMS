import 'package:flutter/material.dart';

import '../../data/local/my_shared_preference.dart';
import '../../data/local/user_data.dart';
import '../../data/model/getWeekMasterResponse.dart';
import '../../data/model/storemodule/get_total_sale_booking_report_response.dart';
import '../../data/remote/result.dart';
import '../../data/repository/SaleReportRepository.dart';
import '../../ui_values/controls_ui.dart';

class GetTotalSalesBookingReportScreen extends StatefulWidget {
  const GetTotalSalesBookingReportScreen({super.key});

  @override
  State<GetTotalSalesBookingReportScreen> createState() =>
      _GetTotalSalesBookingReportScreenState();
}

class _GetTotalSalesBookingReportScreenState
    extends State<GetTotalSalesBookingReportScreen> {
  bool dataLoading = false;
  late UserData userData;
  num storeLocationID = 1;
  SaleReturnIdList? getSaleReturnIdList;
  SaleReturnIdList? salesDetailsList;
  List<SaleReturnIdList> getSaleReturnIdListData = [];
  List<SalesDetails> salesDetails = [];


  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    getTotalSaleBookingReport();
    super.initState();
  }

  void getTotalSaleBookingReport() async {
    setState(() {
      dataLoading = true;
    });
    var result = await SaleReportRepository().getTotalSaleBookingReportAPI(userData);
    if (result is Success) {
      setState(() {
        getSaleReturnIdListData = result.data as List<SaleReturnIdList>;
        getSaleReturnIdList = getSaleReturnIdListData.isNotEmpty ? getSaleReturnIdListData[0] : null;
        debugPrint('date==>$getSaleReturnIdListData');// Or use this date in your Flutter widget
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
        title: const Text('Get Total Sales Booking'),
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
                  itemCount: getSaleReturnIdListData.length - 1,
                  itemBuilder: (BuildContext context, int index) {
                    var currentData = getSaleReturnIdListData[index];
                    var currentSaleDetailsData = currentData.salesDetails?[index];
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
                                                'Total Sales Booking'.toUpperCase(),
                                                16,
                                                FontWeight.bold,
                                                Colors.black54),
                                            customTextView(
                                                context,
                                                currentData.customerName.toString(),
                                                14,
                                                FontWeight.normal,
                                                Colors.black87),
                                            customTextView(
                                                context,
                                                "Qty: ${currentSaleDetailsData!.qty.toString()}",
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
                                                'assets/sales_amount.png',
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
                                              'TOTAL AMOUNT',
                                              12,
                                              FontWeight.bold,
                                              Colors.black54),
                                          customTextView(
                                              context,
                                              "₹ ${currentSaleDetailsData.totalAmt.toString()}",
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
                                          customTextView(context, 'ITEM GROUP NAME', 12,
                                              FontWeight.bold, Colors.black54),
                                          customTextView(
                                              context,
                                              currentSaleDetailsData.itemGroupName.toString(),
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
  }


}
