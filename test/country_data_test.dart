import 'package:country/transactions/models/countriesModel.dart';
import 'package:country/transactions/models/countryDataModel.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Testing Country Data Model for India', () {
    List<CountryDataModel> countryDataModel;
    http.Client client = http.Client();

    test('Data should be initialised', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel.isEmpty, false);
    });
    test('Data count should be 1', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel.length, 1);
    });
    test('Data Common name should be India', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].name.common, "India");
    });
    test('Data Official Name should be Republic of india', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].name.official, "Republic of India");
    });
    test('Data Flag should not be empty', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].flags.png.isEmpty, false);
    });
    test('Data Country Code should not be empty', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].cca2.isEmpty, false);
    });
    test('Data Population should be 1380004385', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].population, 1380004385);
    });
    test('Data Demonym should be Indian', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].demonyms["eng"]["m"], "Indian");

      expect(countryDataModel[0].demonyms["eng"]["f"], "Indian");
    });
    test('Data Currency should be INR', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].currencies["INR"]["name"], "Indian rupee");
    });

    test('Data Capital should be New Delhi', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/name/india?fields=name,flags,currencies,capital,population,cca2,demonyms"));
      countryDataModel = countryDataModelFromMap(res.body.toString());
      expect(countryDataModel[0].capital[0], "New Delhi");
    });
  });

  group('Testing Country list for Different Regions', () {
    CountriesModel countriesModel;

    http.Client client = http.Client();
    test('Data length for Asia', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/region/asia?fields=name,flags"));
      final countriesModel = countriesModelFromMap(res.body);

      expect(countriesModel.length, 50);
    });
    test('Data length for Europe', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/region/europe?fields=name,flags"));
      final countriesModel = countriesModelFromMap(res.body);

      expect(countriesModel.length, 53);
    });

    test('Data length for Africa', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/region/africa?fields=name,flags"));
      final countriesModel = countriesModelFromMap(res.body);

      expect(countriesModel.length, 59);
    });
    test('Data length for Americas', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/region/americas?fields=name,flags"));
      final countriesModel = countriesModelFromMap(res.body);

      expect(countriesModel.length, 56);
    });
    test('Data length for Oceania', () async {
      var res = await client.get(Uri.parse(
          "https://restcountries.com/v3.1/region/Oceania?fields=name,flags"));
      final countriesModel = countriesModelFromMap(res.body);

      expect(countriesModel.length, 27);
    });
  });
}
