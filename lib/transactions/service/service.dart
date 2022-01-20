import 'dart:io';

import 'package:country/transactions/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

class Service {
  static var client = http.Client();
  static var timeoutTime = 10;

  /// Get request
  static Future getCountriesByRegion(region) async {
    var url = EndPoints.baseURL;
    return await client
        .get(Uri.parse(url + "/region/" + region + "?fields=name,flags"))
        .timeout(Duration(seconds: timeoutTime))
        .catchError((error) {
      return http.Response(error.toString(), HttpStatus.badGateway);
    }).onError((error, stackTrace) {
      return http.Response(error.toString(), HttpStatus.badGateway);
    });
  }

  /// Get request
  static Future getDataByCountry(country) async {
    var url = EndPoints.baseURL;
    return await client
        .get(Uri.parse(url +
            "/name/" +
            country +
            "?fields=name,flags,currencies,capital,population,cca2,demonyms"))
        .timeout(Duration(seconds: timeoutTime))
        .catchError((error) {
      return http.Response(error.toString(), HttpStatus.badGateway);
    }).onError((error, stackTrace) {
      return http.Response(error.toString(), HttpStatus.badGateway);
    });
  }

  /// Get request
  static Future getCountriesBySearch(country) async {
    var url = EndPoints.baseURL;
    return await client
        .get(Uri.parse(url +
            "/name/" +
            country +
            "?fields=name,flags,currencies,capital,population,cca2,demonyms"))
        .timeout(Duration(seconds: timeoutTime))
        .catchError((error) {
      return http.Response(error.toString(), HttpStatus.badGateway);
    }).onError((error, stackTrace) {
      return http.Response(error.toString(), HttpStatus.badGateway);
    });
  }
}
