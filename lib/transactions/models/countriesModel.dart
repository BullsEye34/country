// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromMap(jsonString);

import 'dart:convert';

List<CountriesModel> countriesModelFromMap(String str) =>
    List<CountriesModel>.from(
        json.decode(str).map((x) => CountriesModel.fromMap(x)));

String countriesModelToMap(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CountriesModel {
  CountriesModel({
    required this.flags,
    required this.name,
  });

  Flags flags;
  Name name;

  factory CountriesModel.fromMap(Map<String, dynamic> json) => CountriesModel(
        flags: Flags.fromMap(json["flags"]),
        name: Name.fromMap(json["name"]),
      );

  Map<String, dynamic> toMap() => {
        "flags": flags.toMap(),
        "name": name.toMap(),
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
    required this.nativeName,
  });

  String common;
  String official;
  Map<String, NativeName> nativeName;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]).map(
            (k, v) => MapEntry<String, NativeName>(k, NativeName.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class NativeName {
  NativeName({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory NativeName.fromMap(Map<String, dynamic> json) => NativeName(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toMap() => {
        "official": official,
        "common": common,
      };
}
