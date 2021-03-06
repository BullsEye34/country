import 'dart:convert';

import 'package:country/shared_preferences/sharedPrefs.dart';
import 'package:country/transactions/models/countriesModel.dart';
import 'package:country/transactions/models/countryDataModel.dart';
import 'package:country/transactions/service/service.dart';
import 'package:flutter/cupertino.dart';

class States extends ChangeNotifier {
  /// Places where Data is stored
  CountriesModel? _countriesModel = null;
  CountryDataModel? countryDataModel = null;
  List<CountriesModel>? countriesList = null;

  /// useful when error handling
  Map<String, dynamic> countryList = {
    "success": null,
    "error": null,
    "data": [],
    "errorMessage": null
  };
  List<CountryDataModel>? countryDataList = null;

  /// getter
  void getCountriedByRegion(String region) {
    Service.getCountriesByRegion(region).then((response) async {
      var o = response;
      if (response.statusCode == 200) {
        o = o.body.toString();
        countriesList = List<CountriesModel>.from(
            json.decode(o).map((model) => CountriesModel.fromMap(model)));

        countryList["success"] = true;
        countryList["error"] = false;
        countryList["data"] = countriesList;

        await MySharedPreferences().setCountries(o!);
      } else if (response.statusCode == 404) {
        countryList["success"] = false;
        countryList["error"] = true;
        countryList["errorMessage"] = "404";
      } else if (response.statusCode == 502) {
        countryList["success"] = false;
        countryList["error"] = true;
        countryList["errorMessage"] = "502";
        countriesList = List<CountriesModel>.from(json
            .decode((await MySharedPreferences().getCountries()).toString())
            .map((model) => CountriesModel.fromMap(model)));
        countryList["data"] = countriesList;
      }

      notifyListeners();
    });
  }

  /// getter
  void getCountryData(String country) {
    Service.getDataByCountry(country).then((response) {
      var o = response;
      o = o.body.toString();
      countryDataModel = CountryDataModel.fromMap(json.decode(o)[0]);
      notifyListeners();
    });
  }

  /// getter
  void getCountriesBySearch(String search) {
    Service.getCountriesBySearch(search).then((response) {
      var o = response;

      if (response.statusCode == 200) {
        o = o.body.toString();
        countryDataList = List<CountryDataModel>.from(
            json.decode(o).map((model) => CountryDataModel.fromMap(model)));

        countryList["success"] = true;
        countryList["error"] = false;
        countryList["data"] = countryDataList;
      } else if (response.statusCode == 404) {
        countryList["success"] = false;
        countryList["error"] = true;
        countryList["errorMessage"] = "404";
      } else if (response.statusCode == 502) {
        countryList["success"] = false;
        countryList["error"] = true;
        countryList["errorMessage"] = "502";
      }

      notifyListeners();
    });
  }

  /// clear Data
  void clearDataCountries() {
    countriesList = null;
    countryList["data"] = [];
    notifyListeners();
  }

  /// clear Data
  void clearSearchData() {
    countryDataList = null;
    countryList["data"] = [];
    notifyListeners();
  }

  /// clear Data
  void clearDataCountryData() {
    countryDataModel = null;
    notifyListeners();
  }
}
