import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hrms/data/model/user_validate_response.dart';
import 'package:hrms/data/remote/network_values.dart';
import '../../data/local/my_shared_preference.dart';
import '../../data/model/base_response.dart';
import '../../data/remote/result.dart';
import '../../data/repository/auth_repository.dart';
import 'login_screen.dart';



class UserNameCodeScreen extends StatefulWidget {
  const UserNameCodeScreen({super.key});

  @override
  _UserNameCodeScreenState createState() => _UserNameCodeScreenState();
}

class _UserNameCodeScreenState extends State<UserNameCodeScreen> {
  final TextEditingController _userNameCodeController = TextEditingController();
  bool isLoading = false;
  String retrieveCompanyCode = "";
  String userNameCode = "";

  @override
  void initState() {
    super.initState();
    retrieveCompanyCodeFromStorage();
  }

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
              Text("Enter User Name", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              const SizedBox(height: 20),
              TextField(
                controller: _userNameCodeController,
                decoration: InputDecoration(
                  hintText: "Enter User Name(e.g. ah101)",
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
                  userNameCode = _userNameCodeController.text.trim();
                  if (userNameCode.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    userNameWithSalt(retrieveCompanyCode, userNameCode);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter user name")));
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

  Future<void> retrieveCompanyCodeFromStorage() async {
    Map<String, String?> credentials = await MySharedPreference.getCompanyCode();
    setState(() {
      retrieveCompanyCode = credentials['companyCode'] ?? "Guest"; // Set username or show "Guest"
    });
    print("Loaded Company Code: $retrieveCompanyCode");
  }

  void userNameWithSalt(String orgCode, String username) async {
    Result response = await AuthRepository().getSalt(orgCode);
    if (response is Success) {
      BaseResponse data = response.data;
      if (data.isSuccess()) {
        validateUserNameWithCredentials(data.message, orgCode, username);
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, data.message);
      }
    }
  }

  void validateUserNameWithCredentials(String userToken, String orgCode, String username) async {
    Result response = await AuthRepository().validateUserName(userNameCode, "dummypass", userToken, orgCode);
    if (response is Success) {
      ValidateUserResponse data = response.data;
      setState(() {
        isLoading = false;
      });
      if(data.messageType==1){
        await MySharedPreference.saveUserNameCode(username);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        print("User Validate successful:$username");
      } else {
        showSnackBar(context, data.message);
        print("User Validate failed: $username");
      }

    } else if (response is Failure) {
      setState(() {
        isLoading = false;
      });
      print("User Validate failed: ${response.message}");
      showSnackBar(context, response.message);
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
