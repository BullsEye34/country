// To parse this JSON data, do
//
//     final countryDataModel = countryDataModelFromMap(jsonString);

import 'dart:convert';

List<CountryDataModel> countryDataModelFromMap(String str) =>
    List<CountryDataModel>.from(
        json.decode(str).map((x) => CountryDataModel.fromMap(x)));

String countryDataModelToMap(List<CountryDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CountryDataModel {
  CountryDataModel({
    required this.flags,
    required this.name,
    required this.cca2,
    this.currencies,
    required this.capital,
    this.demonyms,
    required this.population,
  });

  Flags flags;
  Name name;
  String cca2;
  dynamic currencies;
  List<String> capital;
  dynamic demonyms;
  int population;

  factory CountryDataModel.fromMap(Map<String, dynamic> json) =>
      CountryDataModel(
        flags: Flags.fromMap(json["flags"]),
        name: Name.fromMap(json["name"]),
        cca2: json["cca2"],
        currencies: json["currencies"],
        capital: List<String>.from(json["capital"].map((x) => x)),
        demonyms: json["demonyms"],
        population: json["population"],
      );

  Map<String, dynamic> toMap() => {
        "flags": flags.toMap(),
        "name": name.toMap(),
        "cca2": cca2,
        "currencies": currencies,
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "demonyms": demonyms,
        "population": population,
      };
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory Flags.fromMap(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toMap() => {
        "png": png,
        "svg": svg,
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
    this.nativeName,
  });

  String common;
  String official;
  dynamic nativeName;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"],
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
        "nativeName": nativeName,
      };
}
