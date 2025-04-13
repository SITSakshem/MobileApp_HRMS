import 'package:flutter/material.dart';
import 'package:hrms/common/navigate_page.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/model/base_response.dart';
import 'package:hrms/data/model/forgot_password_response.dart';
import 'package:hrms/data/model/login_response.dart';
import 'package:hrms/data/remote/result.dart';
import 'package:hrms/screen/login_flow/CompanyCodeScreen.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:hrms/ui_values/space_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/remote/network_values.dart';
import '../../data/repository/auth_repository.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum LoginStep { companyCode, credentials }

class LoginScreen extends StatefulWidget {
  final LoginStep step;

  const LoginScreen({super.key, this.step = LoginStep.companyCode});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordValue = TextEditingController();

  bool isLoading = false;
  bool rememberMe = false;
  final formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  late MySharedPreference mySharedPreference;
  String retrieveCompanyCode = "";
  String retrieveCompanyName = "";
  String retrieveUserNameCode = "";

  @override
  void initState() {
    super.initState();
    mySharedPreference = MySharedPreference();
    //companyValue.text = "AH";
    _loadSavedCredentials();
    retrieveCompanyCodeFromStorage();
    retrieveUserCodeFromStorage();
    retrieveCompanyNameFromStorage();
  }

  Future<void> _loadSavedCredentials() async {
    String? savedPassword = await storage.read(key: 'password');
    if (savedPassword != null) passwordValue.text = savedPassword;
    setState(() {
      rememberMe = savedPassword != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoTile(context),
                  customTextView(
                      context,
                      retrieveCompanyName,
                      18,
                      FontWeight.normal,
                      Colors.blueGrey),
                    hSpacer(8),
                  customTextView(
                      context,
                      "User Name: $retrieveUserNameCode",
                      18,
                      FontWeight.normal,
                      Colors.blueGrey),
                  hSpacer(16),
                  ThemedTextField(
                    text: 'Password',
                    tec: passwordValue,
                    isObscure: true,
                  ),
                  hSpacer(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          const Text('Remember Me'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0), // Add margin to the end
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoading = true;
                            });
                            forgotPassword(retrieveUserNameCode, retrieveCompanyCode);
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  hSpacer(16),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ThemedButton(
                      text: 'SIGN IN',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (retrieveCompanyCode.toString().isEmpty || retrieveUserNameCode.toString().isEmpty || passwordValue.text.isEmpty) {
                            showSnackBar(context, 'Must enter username and password');
                            return;
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            _handleRememberMe();
                            loginWithSalt(retrieveCompanyCode);
                            print("Updated companyCode: $retrieveCompanyCode");
                            print("Updated UserName: $retrieveUserNameCode");
                          }
                        } else {
                          showSnackBar(context, 'Please enter valid credentials');
                        }
                      }),
                  hSpacer(30),
                  GestureDetector(
                    onTap: () {
                      MySharedPreference().resetLogin(false);
                      MySharedPreference.clearCredentials();
                      MySharedPreference.clearCompanyCode();
                      MySharedPreference.clearCompanyName();
                      MySharedPreference.clearUserNameCode();
                      goToLoginAfterLogout(context);
                    },
                    child: const Text(
                      "Sign In as a different user ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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

  Future<void> retrieveCompanyNameFromStorage() async {
    Map<String, String?> credentials = await MySharedPreference.getCompanyName();
    setState(() {
      retrieveCompanyName = credentials['companyName'] ?? "Ananya Herbal-AH";
    });
    print("Loaded Company Name: $retrieveCompanyName");
  }

  Future<void> retrieveUserCodeFromStorage() async {
    Map<String, String?> credentials = await MySharedPreference.getUserNameCode();
    setState(() {
      retrieveUserNameCode = credentials['userNameCode'] ?? "ah101"; // Set username or show "Guest"
    });
    print("Loaded Username: $retrieveUserNameCode");
  }

  Future<void> _handleRememberMe() async {
    print("Remember Me: $rememberMe");
    if (rememberMe) {
      await MySharedPreference.saveCredentials(retrieveUserNameCode, passwordValue.text);
    } else {
      await MySharedPreference.clearCredentials();
    }
  }

  void loginWithSalt(String orgCode) async {
    Result response = await AuthRepository().getSalt(orgCode);
    if (response is Success) {
      BaseResponse data = response.data;
      if (data.isSuccess()) {
        loginWithCredentials(data.message, orgCode);
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

  void loginWithCredentials(String userToken, String orgCode) async {
    Result response = await AuthRepository().login(retrieveUserNameCode, passwordValue.text, userToken, orgCode);
    if (response is Success) {
      Login login = response.data;
      MySharedPreference().storeUserData(userToken, login);
      setState(() {
        isLoading = false;
      });
      mySharedPreference.resetLogin(true);
      print("Login successful: Redirecting to Dashboard");
      goToDashboard(context);
    } else if (response is Failure) {
      setState(() {
        isLoading = false;
      });
      mySharedPreference.resetLogin(false);
      print("Login failed: ${response.message}");
      showSnackBar(context, response.message);
    }
  }

  void forgotPassword(String username, String orgCode) async {
    Result response = await AuthRepository().forgotPassword(retrieveUserNameCode, orgCode);
    if (response is Success) {
      ForgotPasswordResponse data = response.data;
      setState(() {
        isLoading = false;
      });
      if(data.messageType==1){
        forgotPasswordAlertDialog(data.message); //Need to show alert dialog here
        print("Forgot password successful:${data.message}");
      } else {
        showSnackBar(context, data.message);
        print("Forgot password failed: ${data.message}");
      }

    } else if (response is Failure) {
      setState(() {
        isLoading = false;
      });
      print("Forgot password failed: ${response.message}");
      showSnackBar(context, response.message);
    }
  }

  Future<void> _launchForgotPasswordURL() async {
    String baseUrl = NetworkValues.LIVE_DOMAIN;
    final Uri url = Uri.parse('https://ah.ourhrms.com/Identity/Account/ForgotPassword');
    //final Uri url = Uri.parse('$baseUrl/Identity/Account/ForgotPassword');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }


  void forgotPasswordAlertDialog(String responseMessage){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(responseMessage),
        content: const Text(
            "The system will send a reset password link to the email address associated with your account."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  /// create snackBar
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 4),
    ));
  }
}

