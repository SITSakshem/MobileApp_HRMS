import 'package:flutter/material.dart';

class ApiService with ChangeNotifier {
  String _companyCode = "ah"; // Default value
  String _baseUrl = "https://ah.ourhrms.com/"; // Default API URL

  String get baseUrl => _baseUrl;

  void setCompanyCode(String companyCode) {
    _companyCode = companyCode.toLowerCase();
    _baseUrl = "https://$_companyCode.ourhrms.com/"; // Update base URL
    notifyListeners();
  }
}
