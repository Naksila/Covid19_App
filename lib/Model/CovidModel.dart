// To parse this JSON data, do
//
//     final covid19 = covid19FromJson(jsonString);

import 'dart:convert';

Covid19 covid19FromJson(String str) => Covid19.fromJson(json.decode(str));

String covid19ToJson(Covid19 data) => json.encode(data.toJson());

class Covid19 {
  Covid19({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newConfirmed,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.updateDate,
    this.devBy,
  });

  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  String updateDate;
  String devBy;

  factory Covid19.fromJson(Map<String, dynamic> json) => Covid19(
    confirmed: json["Confirmed"],
    recovered: json["Recovered"],
    hospitalized: json["Hospitalized"],
    deaths: json["Deaths"],
    newConfirmed: json["NewConfirmed"],
    newRecovered: json["NewRecovered"],
    newHospitalized: json["NewHospitalized"],
    newDeaths: json["NewDeaths"],
    updateDate: json["UpdateDate"],
    devBy: json["DevBy"],
  );

  Map<String, dynamic> toJson() => {
    "Confirmed": confirmed,
    "Recovered": recovered,
    "Hospitalized": hospitalized,
    "Deaths": deaths,
    "NewConfirmed": newConfirmed,
    "NewRecovered": newRecovered,
    "NewHospitalized": newHospitalized,
    "NewDeaths": newDeaths,
    "UpdateDate": updateDate,
    "DevBy": devBy,
  };
}
