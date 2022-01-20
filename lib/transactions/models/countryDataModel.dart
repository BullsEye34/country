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
    required this.currencies,
    required this.capital,
    required this.demonyms,
    required this.population,
  });

  Flags flags;
  Name name;
  String cca2;
  Currencies currencies;
  List<String> capital;
  Demonyms demonyms;
  int population;

  factory CountryDataModel.fromMap(Map<String, dynamic> json) =>
      CountryDataModel(
        flags: Flags.fromMap(json["flags"]),
        name: Name.fromMap(json["name"]),
        cca2: json["cca2"],
        currencies: Currencies.fromMap(json["currencies"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        demonyms: Demonyms.fromMap(json["demonyms"]),
        population: json["population"],
      );

  Map<String, dynamic> toMap() => {
        "flags": flags.toMap(),
        "name": name.toMap(),
        "cca2": cca2,
        "currencies": currencies.toMap(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "demonyms": demonyms.toMap(),
        "population": population,
      };
}

class Currencies {
  Currencies({
    required this.inr,
  });

  Inr inr;

  factory Currencies.fromMap(Map<String, dynamic> json) => Currencies(
        inr: Inr.fromMap(json["INR"]),
      );

  Map<String, dynamic> toMap() => {
        "INR": inr.toMap(),
      };
}

class Inr {
  Inr({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Inr.fromMap(Map<String, dynamic> json) => Inr(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "symbol": symbol,
      };
}

class Demonyms {
  Demonyms({
    required this.eng,
    required this.fra,
  });

  FraClass eng;
  FraClass fra;

  factory Demonyms.fromMap(Map<String, dynamic> json) => Demonyms(
        eng: FraClass.fromMap(json["eng"]),
        fra: FraClass.fromMap(json["fra"]),
      );

  Map<String, dynamic> toMap() => {
        "eng": eng.toMap(),
        "fra": fra.toMap(),
      };
}

class FraClass {
  FraClass({
    required this.f,
    required this.m,
  });

  String f;
  String m;

  factory FraClass.fromMap(Map<String, dynamic> json) => FraClass(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toMap() => {
        "f": f,
        "m": m,
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
  NativeName nativeName;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: NativeName.fromMap(json["nativeName"]),
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
        "nativeName": nativeName.toMap(),
      };
}

class NativeName {
  NativeName({
    required this.eng,
    required this.hin,
    required this.tam,
  });

  HinClass eng;
  HinClass hin;
  HinClass tam;

  factory NativeName.fromMap(Map<String, dynamic> json) => NativeName(
        eng: HinClass.fromMap(json["eng"]),
        hin: HinClass.fromMap(json["hin"]),
        tam: HinClass.fromMap(json["tam"]),
      );

  Map<String, dynamic> toMap() => {
        "eng": eng.toMap(),
        "hin": hin.toMap(),
        "tam": tam.toMap(),
      };
}

class HinClass {
  HinClass({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory HinClass.fromMap(Map<String, dynamic> json) => HinClass(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toMap() => {
        "official": official,
        "common": common,
      };
}
