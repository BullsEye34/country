// To parse this JSON data, do
//
//     final countries = countriesFromMap(jsonString);

import 'dart:convert';

class CountriesModel {
  CountriesModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  Name name;
  List<String> tld;
  String cca2;
  String ccn3;
  String cca3;
  String cioc;
  bool independent;
  String status;
  bool unMember;
  Currencies currencies;
  Idd idd;
  List<String> capital;
  List<String> altSpellings;
  String region;
  String subregion;
  Languages languages;
  Map<String, Translation> translations;
  List<double> latlng;
  bool landlocked;
  List<String> borders;
  int area;
  Demonyms demonyms;
  String flag;
  Maps maps;
  int population;
  Gini gini;
  String fifa;
  Car car;
  List<String> timezones;
  List<String> continents;
  CoatOfArms flags;
  CoatOfArms coatOfArms;
  String startOfWeek;
  CapitalInfo capitalInfo;
  PostalCode postalCode;

  factory CountriesModel.fromJson(String str) =>
      CountriesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountriesModel.fromMap(Map<String, dynamic> json) => CountriesModel(
        name: Name.fromMap(json["name"]),
        tld: List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: Currencies.fromMap(json["currencies"]),
        idd: Idd.fromMap(json["idd"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"],
        subregion: json["subregion"],
        languages: Languages.fromMap(json["languages"]),
        translations: Map.from(json["translations"]).map(
            (k, v) => MapEntry<String, Translation>(k, Translation.fromMap(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
        landlocked: json["landlocked"],
        borders: List<String>.from(json["borders"].map((x) => x)),
        area: json["area"],
        demonyms: Demonyms.fromMap(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromMap(json["maps"]),
        population: json["population"],
        gini: Gini.fromMap(json["gini"]),
        fifa: json["fifa"],
        car: Car.fromMap(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: CoatOfArms.fromMap(json["flags"]),
        coatOfArms: CoatOfArms.fromMap(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        capitalInfo: CapitalInfo.fromMap(json["capitalInfo"]),
        postalCode: PostalCode.fromMap(json["postalCode"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name.toMap(),
        "tld": List<dynamic>.from(tld.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": currencies.toMap(),
        "idd": idd.toMap(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": region,
        "subregion": subregion,
        "languages": languages.toMap(),
        "translations": Map.from(translations)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "area": area,
        "demonyms": demonyms.toMap(),
        "flag": flag,
        "maps": maps.toMap(),
        "population": population,
        "gini": gini.toMap(),
        "fifa": fifa,
        "car": car.toMap(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(continents.map((x) => x)),
        "flags": flags.toMap(),
        "coatOfArms": coatOfArms.toMap(),
        "startOfWeek": startOfWeek,
        "capitalInfo": capitalInfo.toMap(),
        "postalCode": postalCode.toMap(),
      };
}

class CapitalInfo {
  CapitalInfo({
    required this.latlng,
  });

  List<double> latlng;

  factory CapitalInfo.fromJson(String str) =>
      CapitalInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CapitalInfo.fromMap(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
      };
}

class Car {
  Car({
    required this.signs,
    required this.side,
  });

  List<String> signs;
  String side;

  factory Car.fromJson(String str) => Car.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        signs: List<String>.from(json["signs"].map((x) => x)),
        side: json["side"],
      );

  Map<String, dynamic> toMap() => {
        "signs": List<dynamic>.from(signs.map((x) => x)),
        "side": side,
      };
}

class CoatOfArms {
  CoatOfArms({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory CoatOfArms.fromJson(String str) =>
      CoatOfArms.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoatOfArms.fromMap(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toMap() => {
        "png": png,
        "svg": svg,
      };
}

class Currencies {
  Currencies({
    required this.eur,
  });

  Eur eur;

  factory Currencies.fromJson(String str) =>
      Currencies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currencies.fromMap(Map<String, dynamic> json) => Currencies(
        eur: Eur.fromMap(json["EUR"]),
      );

  Map<String, dynamic> toMap() => {
        "EUR": eur.toMap(),
      };
}

class Eur {
  Eur({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Eur.fromJson(String str) => Eur.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Eur.fromMap(Map<String, dynamic> json) => Eur(
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

  Eng eng;
  Eng fra;

  factory Demonyms.fromJson(String str) => Demonyms.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Demonyms.fromMap(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromMap(json["eng"]),
        fra: Eng.fromMap(json["fra"]),
      );

  Map<String, dynamic> toMap() => {
        "eng": eng.toMap(),
        "fra": fra.toMap(),
      };
}

class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  String f;
  String m;

  factory Eng.fromJson(String str) => Eng.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Eng.fromMap(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toMap() => {
        "f": f,
        "m": m,
      };
}

class Gini {
  Gini({
    required this.the2018,
  });

  int the2018;

  factory Gini.fromJson(String str) => Gini.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gini.fromMap(Map<String, dynamic> json) => Gini(
        the2018: json["2018"],
      );

  Map<String, dynamic> toMap() => {
        "2018": the2018,
      };
}

class Idd {
  Idd({
    required this.root,
    required this.suffixes,
  });

  String root;
  List<String> suffixes;

  factory Idd.fromJson(String str) => Idd.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Idd.fromMap(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "root": root,
        "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
      };
}

class Languages {
  Languages({
    required this.slk,
  });

  String slk;

  factory Languages.fromJson(String str) => Languages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Languages.fromMap(Map<String, dynamic> json) => Languages(
        slk: json["slk"],
      );

  Map<String, dynamic> toMap() => {
        "slk": slk,
      };
}

class Maps {
  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  String googleMaps;
  String openStreetMaps;

  factory Maps.fromJson(String str) => Maps.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Maps.fromMap(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toMap() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
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

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

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
    required this.slk,
  });

  Translation slk;

  factory NativeName.fromJson(String str) =>
      NativeName.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NativeName.fromMap(Map<String, dynamic> json) => NativeName(
        slk: Translation.fromMap(json["slk"]),
      );

  Map<String, dynamic> toMap() => {
        "slk": slk.toMap(),
      };
}

class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory Translation.fromJson(String str) =>
      Translation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toMap() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  PostalCode({
    required this.format,
    required this.regex,
  });

  String format;
  String regex;

  factory PostalCode.fromJson(String str) =>
      PostalCode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostalCode.fromMap(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toMap() => {
        "format": format,
        "regex": regex,
      };
}
