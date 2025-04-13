import 'package:flutter/material.dart';
import 'package:hrms/common/hexColor.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:intl/intl.dart';

import '../../ui_values/space_ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserData userData;
  DateFormat f = DateFormat('dd-MM-yyyy hh:mm a');
  var outputFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    super.initState();
  }

  /// create profile screen
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Row(children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
                vSpacer(),
                const Text('Profile'),
              ]),
            ),
            body: profileData(context)),
      ),
    );
  }

  Widget profileData(context) {
    return Container(
      color: HexColor('#E6EFFA'),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hSpacer(8),
          rowData(context, 'Name', userData.empName),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowData(context, 'Department', userData.department),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowData(context, 'Date of Joining', userData.joiningDate),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowData(context, 'Date of Birth', userData.birthDate),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowData(context, 'Shift Details : Shitname / Timing', userData.empShiftName),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowData(context, 'Week off:', userData.empWeekoffName),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowDataForScreen(context, 'Company/Territory:', userData.empCompany),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowData(context, 'Location/Store', userData.empLocation),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          rowData(context, 'Zone/Sub-Territory', userData.empZone),
          hSpacer(8),
          const Divider(height: 2),
          hSpacer(16),
          //rowData(context, 'Address', loginModel?.??''),
        ],
      ),
    );
  }
}
