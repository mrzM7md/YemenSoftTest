import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isThereInternetConnection() async {
  var result =  await Connectivity().checkConnectivity();
  return ! result.contains(ConnectivityResult.none);
}

Future<bool> isThereDataInsideInternetConnection() async {
  List<ConnectivityResult> results = await Connectivity().checkConnectivity();
  // إذا كانت القائمة لا تحتوي على none
  if (!results.contains(ConnectivityResult.none)) {
    // نتحقق من الوصول الفعلي إلى الإنترنت.
    bool hasInternet = await InternetConnectionChecker.instance.hasConnection;
    return hasInternet;
  }
  return false;
}

Future<bool> isThereInternetConnectionOrDataInsideInternetConnection() async {
  if(await isThereInternetConnection()){
    return await isThereDataInsideInternetConnection();
  }
  return false;
}