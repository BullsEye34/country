import 'package:digitaltrons/transactions/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

class Service {
  static var client = http.Client();
  static var timeoutTime = 5;

  static Future getCountriesByRegion(region) async {
    var url = EndPoints.baseURL;
    return await client
        .get(Uri.parse(url + "/region/" + region + "?fields=name,flags"))
        .timeout(Duration(seconds: timeoutTime))
        .onError((error, stackTrace) => Future(() => throw error!));
  }
}
