import 'package:shared_preferences/shared_preferences.dart';

/// We use SharedPreferences to store data locally.
///
/// We can specify variables and use them witha getter and a setter.
class MySharedPreferences {
// SharedPreferences Key Constants
  String kSPCountries = '';

  /*----------------------------------- SETTER -----------------------*/

  /// Set the Data to the device
  Future<bool> setCountries(countryList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(kSPCountries, countryList);
  }

  /*----------------------------------- GETTER -----------------------*/

  /// Get the Data from the device
  Future<String?> getCountries() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kSPCountries).toString();
  }
}
