// To parse this JSON data, do
//
// final countries = countriesFromJson(jsonString);

import 'dart:convert';

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

String countriesToJson(Countries data) => json.encode(data.toJson());

class Countries {
  List<Country> countries;

  Countries({
    required this.countries,
  });

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  String country;
  List<String> states;

  Country({
    required this.country,
    required this.states,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        country: json["country"],
        states: List<String>.from(json["states"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "states": List<dynamic>.from(states.map((x) => x)),
      };
  @override
  String toString() {
    return 'Country: $country, States: $states';
  }
}
