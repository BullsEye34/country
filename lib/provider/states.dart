import 'dart:convert';

import 'package:digitaltrons/transactions/models/countriesModel.dart';
import 'package:digitaltrons/transactions/service/service.dart';
import 'package:flutter/cupertino.dart';

class States extends ChangeNotifier {
  CountriesModel? _countriesModel;
  List<CountriesModel>? countriesList;
  void getCountriedByRegion(String region) {
    Service.getCountriesByRegion(region).then((response) {
      var o = response;
      o = o.body.toString();
      countriesList = List<CountriesModel>.from(
          json.decode(o).map((model) => CountriesModel.fromMap(model)));
      notifyListeners();
    });
  }
}
