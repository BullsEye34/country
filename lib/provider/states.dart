import 'dart:convert';

import 'package:digitaltrons/transactions/models/countriesModel.dart';
import 'package:digitaltrons/transactions/service/service.dart';
import 'package:flutter/cupertino.dart';

class States extends ChangeNotifier {
  CountriesModel? _countriesModel;
  void getCountriedByRegion(String region) {
    Service.getCountriesByRegion(region).then((response) {
      var o = response;
      o = o.body.toString();
      _countriesModel = CountriesModel.fromMap(json.decode(o));
      //_countriesModel = value;
      print(_countriesModel!.name.official);
      notifyListeners();
    });
  }
}
