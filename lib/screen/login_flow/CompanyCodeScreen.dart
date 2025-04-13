import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hrms/data/model/org_domain_response.dart';
import 'package:hrms/data/remote/network_values.dart';
import 'package:hrms/screen/login_flow/UserNameCodeScreen.dart';
import '../../data/local/my_shared_preference.dart';
import '../../data/model/base_response.dart';
import '../../data/remote/result.dart';
import '../../data/repository/auth_repository.dart';
import 'login_screen.dart';



class CompanyCodeScreen extends StatefulWidget {
  const CompanyCodeScreen({super.key});

  @override
  _CompanyCodeScreenState createState() => _CompanyCodeScreenState();
}

class _CompanyCodeScreenState extends State<CompanyCodeScreen> {
  final TextEditingController _companyCodeController = TextEditingController();

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo_new.png', height: 150), // Add Bee Image
              const SizedBox(height: 20),
              const Text("Welcome to OurHRMS!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Enter your company code", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              const SizedBox(height: 20),
              TextField(
                controller: _companyCodeController,
                decoration: InputDecoration(
                  hintText: "AH",
                  hintStyle: const TextStyle(color: Colors.grey), // Set hint text color here
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                onPressed: () async {
                  String companyCode = _companyCodeController.text.trim();
                  if (companyCode.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                      validateOrganization(companyCode);
                 } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter a company code")));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                child: const Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );



  }

  void validateOrganization(String orgCode) async {
    Result response = await AuthRepository().validateOrganization(orgCode, "0");
    if (response is Success) {
      GetOrgDomainResponse data = response.data;
      setState(() {
        isLoading = false;
      });
      if(data.messageType=="1"){
        String orgBaseURL = data.message;
        String orgName = data.companyName;
        NetworkValues.onCompanyCodeEntered(orgCode, orgBaseURL);
        await MySharedPreference.saveCompanyCode(orgCode);
        await MySharedPreference.saveCompanyName(orgName);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserNameCodeScreen()));
        print("Get Company Name: $orgName");
        print("Get Domain Response successful: $orgBaseURL");
      } else {
        showSnackBar(context, data.message);
        }
    } else if (response is Failure) {
      setState(() {
        isLoading = false;
      });
      MySharedPreference.clearCompanyCode();
      MySharedPreference.clearCompanyName();
      print("Get Domain Response failed: ${response.message}");

    }
  }

  /// create snackBar
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 4),
    ));
  }
}
