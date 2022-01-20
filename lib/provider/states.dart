import 'dart:convert';

import 'package:country/transactions/models/countriesModel.dart';
import 'package:country/transactions/models/countryDataModel.dart';
import 'package:country/transactions/service/service.dart';
import 'package:flutter/cupertino.dart';

class States extends ChangeNotifier {
  CountriesModel? _countriesModel;
  CountryDataModel? countryDataModel = null;
  List<CountriesModel>? countriesList = null;

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

  void clearDataCountries() {
    countriesList = null;
    notifyListeners();
  }

  void clearDataCountryData() {
    countryDataModel = null;
    notifyListeners();
  }
}
