
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../remote/api_client.dart';

class BaseRepository {
  RestClient client = RestClient(Dio());

  String getErrorMessage(error) {
    print(error.toString());
    return "$error";
  }

  printLog(dynamic data) {
    var logger = Logger(
        printer: PrettyPrinter(
            methodCount: 2, // number of method calls to be displayed
            errorMethodCount:
            8, // number of method calls if stacktrace is provided
            lineLength: 120, // width of the output
            colors: true, // Colorful log messages
            printEmojis: true, // Print an emoji for each log message
            printTime: false // Should each log print contain a timestamp
        ));
    logger.d(data);
  }
}