import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intrapair_mobile_apt_test/models/country_model.dart';

class CountryService {
  Future<List<Countres>> getCountries() async {
    const uri = "https://restcountries.com/v3.1/region/europe";
    final url = Uri.parse(uri);
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;

        final countries = json.map((e) {
          return Countres(
              country: e["name"]["common"], flag: e["flags"]["png"]);
        }).toList();

        return countries;
      }
    } catch (e) {}
    return [];
  }
}
