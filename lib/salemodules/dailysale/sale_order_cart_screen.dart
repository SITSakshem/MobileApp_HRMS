import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/getStoreItemResponseNew.dart';
import 'package:intl/intl.dart';

import '../../data/model/saveSaleModulRespone.dart';
import '../../data/remote/result.dart';
import '../../data/repository/routePlanRepository.dart';
import '../../ui_values/controls_ui.dart';

import 'package:flutter/widgets.dart';

@immutable
class SaleOrderCartScreen extends StatefulWidget {
  final List<StoreItemData> selectedStoreData;
  final UserData userData;
  final String fromDate;
  final String remark;
  final num storeLocationID;

  const SaleOrderCartScreen(this.selectedStoreData, this.userData,
      this.fromDate, this.storeLocationID, this.remark);

  @override
  _SaleOrderCartScreenState createState() => _SaleOrderCartScreenState();
}
class _SaleOrderCartScreenState extends State<SaleOrderCartScreen> {
  bool dataLoading = false;

  late SaveSaleModulRespone saveSale;
  late final TextEditingController _quantityController=TextEditingController();

  void getStoreItems(List salesDetails) async {
    setState(() {
      dataLoading = true;
    });

    var result = await RoutePlanRepository().saveDailySaleItemAPI(
      widget.userData,
      widget.fromDate,
      widget.remark,
      widget.userData.empLocationID,
      true,
      salesDetails,
    );

    if (result is Success) {
      // Optionally, show a success message
      saveSale = result.data ;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(saveSale.message??'')),
      );
      salesDetails.clear();
      // Navigate back to the previous screen
      Navigator.pop(context);
      Navigator.pop(context);
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


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _quantityController.text='1';
  }
  @override
  Widget build(BuildContext context) {
    List<dynamic> salesDetails = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Sale'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              for (var selectedData in widget.selectedStoreData) {
                var itemID = selectedData.itemId;
                var quantity = selectedData.quantity.value.toString();
                var price = selectedData.price.value.toString();

                bool itemExists = salesDetails.any((item) => item['ItemId'] == itemID);

                if (!itemExists) {
                  salesDetails.add({
                    'ItemId': itemID,
                    'Qty': quantity,
                    'ItemRate': price,
                  });
                }
              }
                getStoreItems(salesDetails);
                        // Optional: You might want to perform some action after saving
              // e.g., show a confirmation message or navigate to another screen
              print('Data saved successfully: $salesDetails');
            },
            icon: const Icon(Icons.save),
            label: const Text('Submit'),
          ),
        ],
      ),
      body: Stack(
        children: [
          if (dataLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(1),
                    2: IntrinsicColumnWidth(),
                  },
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ThemedText(
                            text: 'Item',
                            txtColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ThemedText(
                            text: 'Rate',
                            txtColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ThemedText(
                            text: 'Quantity',
                            txtColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ...widget.selectedStoreData.map((item) {
                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FormThemedText(item.name),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FormThemedText(item.itemRate!.isNotEmpty
                                ? '₹${item.itemRate![0].rate.toString()}'
                                : '0'),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      // Decrease the quantity
                                      setState(() {
                                        item.quantity.value = (item.quantity.value > 0) ? item.quantity.value - 1 : 0;
                                        _quantityController.text='${(item.quantity.value > 0) ? item.quantity.value - 1 : 0}';

                                        item.price.value = item.itemRate![0].rate! * item.quantity.value;
                                      });
                                    },
                                  ),

                                  FormThemedText(item.quantity.value.toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        item.price.value = item.itemRate![0].rate! * item.quantity.value;
                                        _quantityController.text='${item.quantity.value++}';
                                      });
                                    },
                                  ),
                                ],
                              ),

                              Obx(() => FormThemedText(item.price.toString()))
                            ],
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}



class Item {
  var isAdded = false.obs;
  String itemRate;

  Item({required this.itemRate});
}