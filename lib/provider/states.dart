import 'dart:convert';

import 'package:country/transactions/models/countriesModel.dart';
import 'package:country/transactions/models/countryDataModel.dart';
import 'package:country/transactions/service/service.dart';
import 'package:flutter/cupertino.dart';

class States extends ChangeNotifier {
  CountriesModel? _countriesModel = null;
  CountryDataModel? countryDataModel = null;
  List<CountriesModel>? countriesList = null;
  List<CountryDataModel>? countryDataList = null;

  void getCountriedByRegion(String region) {
    Service.getCountriesByRegion(region).then((response) {
      var o = response;
      o = o.body.toString();
      countriesList = List<CountriesModel>.from(
          json.decode(o).map((model) => CountriesModel.fromMap(model)));
      notifyListeners();
    });
  }

  void getCountryData(String country) {
    Service.getDataByCountry(country).then((response) {
      var o = response;
      o = o.body.toString();
      countryDataModel = CountryDataModel.fromMap(json.decode(o)[0]);
      notifyListeners();
    });
  }

  void getCountriesBySearch(String search) {
    Service.getCountriesBySearch(search).then((response) {
      var o = response;
      o = o.body.toString();
      countryDataList = List<CountryDataModel>.from(
          json.decode(o).map((model) => CountryDataModel.fromMap(model)));
      notifyListeners();
    });
  }

  void clearDataCountries() {
    countriesList = null;
    notifyListeners();
  }

  void clearSearchData() {
    countryDataList = null;
    notifyListeners();
  }

  void clearDataCountryData() {
    countryDataModel = null;
    notifyListeners();
  }
}
