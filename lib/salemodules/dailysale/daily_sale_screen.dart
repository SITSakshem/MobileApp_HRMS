import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/outdoor_response.dart';
import 'package:hrms/data/repository/outdoor_repository.dart';
import 'package:hrms/salemodules/dailysale/sale_order_cart_screen.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../../common/hexColor.dart';
import '../../../data/model/downline_emp_list.dart';
import '../../../data/remote/result.dart';
import '../../../data/repository/leave_repository.dart';
import '../../../ui_values/controls_ui.dart';
import '../../../ui_values/space_ui.dart';
import '../../data/model/getAllLocationResponse.dart';
import '../../data/model/getStoreItemResponseNew.dart';
import '../../data/repository/routePlanRepository.dart';

class DailySaleScreen extends StatefulWidget {
  const DailySaleScreen({super.key});

  @override
  State<DailySaleScreen> createState() => _DailySaleScreenState();
}

class _DailySaleScreenState extends State<DailySaleScreen> {
  late UserData userData;
  List<OutdoorReport> applicationList = [];

  DateTime now = DateTime.now();
  DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
  DateFormat sendToDB = DateFormat('yyyy-MM-dd');
  DateTime fromDateDate = DateTime.now();
  DateTime toDateDate = DateTime.now();
  late String fromDate = dateFormatter.format(now);
  late String sendToDbDate = sendToDB.format(now);
  late String toDate = dateFormatter.format(now);
  final formKey = GlobalKey<FormState>();

  bool isSubmitPressed = false;
  bool dataLoading = false;

  List<LocationList> getLocationData = [];
  LocationList? selectedType;

  List<StoreItemData> getStoreItemData = [];
  StoreItemData? selectedStoreType;

  num storeLocationID = 1;

  TextEditingController remark = TextEditingController();

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    getAllLocation();
    getStoreItems();
    super.initState();
  }

  void getAllLocation() async {
    setState(() {
      dataLoading = true;
    });
    var result = await RoutePlanRepository().getAllLocationAPI(userData);
    if (result is Success) {
      getLocationData = result.data as List<LocationList>;
      selectedType = getLocationData[0];
      storeLocationID=getLocationData[0].locationId!;
      debugPrint('date==>$getLocationData'); // Or use this date in your Flutter widget
    } else {
      debugPrint(result.toString());
    }
    setState(() {
      dataLoading = false;
    });
  }

  void getStoreItems() async {
    setState(() {
      dataLoading = true;
    });
    var result = await RoutePlanRepository().getStoreItemAPI(userData);
    if (result is Success) {
      getStoreItemData = result.data as List<StoreItemData>;
      getStoreItemData = getStoreItemData.where((e) => e.itemRate!.isNotEmpty).toList();
      selectedStoreType = getStoreItemData[0];
      debugPrint('getStoreItemData==>$getStoreItemData'); // Or use this date in your Flutter widget
    } else {
      debugPrint(result.toString());
    }

    setState(() {
      dataLoading = false;
    });
  }

  int cartCount = 0;

  void updateCartCount() {
    cartCount = getStoreItemData.where((item) => item.isAdded.value).length;
  }

  void toggleItemInCart(StoreItemData item) {
    setState(() {
      item.isAdded.value = !item.isAdded.value;
      item.quantity.value = 1;
      item.price.value = item.itemRate![0].rate??0;
      updateCartCount();
    });
  }



  // void toggleItemInCart(Item item) {
  //   if (item.isAdded.value) {
  //     // Remove item from cart
  //     item.isAdded.value = false;
  //   } else {
  //     // Show quantity input dialog
  //     showQuantityDialog(item);
  //   }
  // }

  void showQuantityDialog(StoreItemData item) {
    Get.defaultDialog(
      title: "Enter Quantity",
      content: TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Enter quantity',
        ),
        onSubmitted: (value) {
          int quantity = int.tryParse(value) ?? 0;
          if (quantity > 0) {
            // Add item to cart with quantity
            addItemToCart(item, quantity);
            Get.back(); // Close the dialog
          }
        },
      ),
    );
  }

  void addItemToCart(StoreItemData item, int quantity) {
    // Add item to cart logic
    item.isAdded.value = true;
    // Save the quantity if needed
    print("Added ${quantity} of ${item.itemRate} to cart");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Sale '),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    setState(() {
                      if (cartCount > 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SaleOrderCartScreen(
                              getStoreItemData.where((e) => e.isAdded.value).toList(),
                              userData,
                              sendToDbDate,
                              storeLocationID,
                              remark.text,
                            ),
                          ),
                        );
                      }
                    });
                  },
                ),
                if (cartCount > 0)
                  Positioned(
                    right: 0,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Center(
                        child: Text(
                          '$cartCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
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
                const FormThemedText('Date'),
                InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 7)), // 7 days ago
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          fromDate = dateFormatter.format(value);
                          sendToDbDate= sendToDB.format(value);
                        });
                      }
                    });
                  },
                  child: RoundedBox(
                    height: 42,
                    child: Row(
                      children: [ThemedText(text: fromDate), const Spacer(), const Icon(Icons.calendar_today)],
                    ),
                  ),
                ),
                hSpacer(12),
                TextFormField(
                  maxLines: 3,
                  maxLength: 360,
                  controller: remark,
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Remark...',
                    labelStyle: TextStyle(color: Color(0xFF72A8D4),fontSize: 12),
                    alignLabelWithHint: true, // Align label with the top left of the input field
                  ),
                  textAlignVertical: TextAlignVertical.top, // Align text to the top of the input field
                ),
                hSpacer(12),
                Visibility(visible: userData.canManageTeam(), child: const FormThemedText('Store / Location')),
                /*Visibility(
                  visible: userData.canManageTeam(),
                  child: RoundedBox(
                    height: 52,
                    marginTop: 0,
                    marginBottom: 0,
                    child: DropdownButton<LocationList>(
                      isExpanded: true,
                      value: selectedType,
                      items: getLocationData.map((LocationList value) {
                        return DropdownMenuItem<LocationList>(
                          value: value,
                          child: ThemedText(text: value.code.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedType = value;
                          if (value != null) {
                            storeLocationID = value.locationId!;
                          }
                        });
                      },
                    ),
                  ),
                ),*/
                EmployeeNameWidget("${userData.empLocation} "),
                hSpacer(20),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3), // Adjust column widths as needed
                      1: FlexColumnWidth(1),
                      2: IntrinsicColumnWidth(),
                    },
                    border: TableBorder.all(
                      color: Colors.grey, // Customize the border color
                      width: 1.0, // Customize the border width
                      style: BorderStyle.solid,
                    ),
                    children: [
                      const TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey, // Customize the header background color
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
                              text: 'Add To Cart',
                              txtColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      ...getStoreItemData.map((item) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormThemedText(item.name),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormThemedText(item.itemRate!.isNotEmpty ? item.itemRate![0].rate.toString() : '0'),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(5.0),
                            //   child: ElevatedButton(
                            //     onPressed:(){
                            //       item.itemRate!.isNotEmpty ? () => toggleItemInCart(item) : null;
                            //     } ,
                            //     style: ElevatedButton.styleFrom(
                            //       backgroundColor: item.isAdded.value ? Colors.redAccent : Colors.green, // Button color
                            //     ),
                            //     child: Text(
                            //       item.itemRate!.isNotEmpty ? (item.isAdded.value ? 'Remove Item' : 'Add to Cart') : 'Not Available',
                            //       style: const TextStyle(color: Colors.white, fontSize: 12),
                            //     ),
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: item.itemRate!.isNotEmpty && item.isAdded.value==false  ? () => openQuantityDialog(item) : ()=>toggleItemInCart(item),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: item.isAdded.value ? Colors.redAccent : Colors.green, // Button color
                                ),
                                child: Text(
                                  item.itemRate!.isNotEmpty ? (item.isAdded.value ? 'Remove Item' : 'Add to Cart') : 'Not Available',
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.all(5.0),
                            //   child: Obx(
                            //         () => ElevatedButton(
                            //       onPressed: item.itemRate!.isNotEmpty
                            //           ? () => toggleItemInCart(item)
                            //           : null,
                            //       style: ElevatedButton.styleFrom(
                            //         backgroundColor:
                            //         item.isAdded.value ? Colors.redAccent : Colors.green,
                            //       ),
                            //       child: Text(
                            //         item.itemRate!.isNotEmpty
                            //             ? (item.isAdded.value ? 'Remove Item' : 'Add to Cart')
                            //             : 'Not Available',
                            //         style: const TextStyle(color: Colors.white, fontSize: 12),
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                Visibility(visible: dataLoading, child: const Center(child: CircularProgressIndicator())),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void openQuantityDialog(StoreItemData item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController quantityController = TextEditingController();

        return AlertDialog(
          title: const Text('Enter Quantity'),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: quantityController,
            decoration: const InputDecoration(hintText: "Quantity"),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Ensures only numeric input
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (quantityController.text.isNotEmpty && int.tryParse(quantityController.text)!>0) {
                  int newQuantity = int.tryParse(quantityController.text) ?? 1;
                  setState(() {
                    item.quantity.value = newQuantity;
                    item.price.value = item.itemRate![0].rate! * newQuantity;
                    item.isAdded.value = true; // Mark the item as added
                    updateCartCount();
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a valid quantity.')));
                }
              },
            ),
          ],
        );
      },
    );
  }


}
