// To parse this JSON data, do
//
//     final covidarea = covidareaFromJson(jsonString);

import 'dart:convert';

Covidarea covidareaFromJson(String str) => Covidarea.fromJson(json.decode(str));

String covidareaToJson(Covidarea data) => json.encode(data.toJson());

class Covidarea {
  Covidarea({
    this.province,
    this.nation,
    this.gender,
    this.lastData,
    this.updateDate,
    this.source,
    this.devBy,
    this.severBy,
  });

  Map<String, int> province;
  Map<String, int> nation;
  Gender gender;
  DateTime lastData;
  String updateDate;
  String source;
  String devBy;
  String severBy;

  factory Covidarea.fromJson(Map<String, dynamic> json) => Covidarea(
    province: json["Province"] == null ? null : Map.from(json["Province"]).map((k, v) => MapEntry<String, int>(k, v)),
    nation: json["Nation"] == null ? null : Map.from(json["Nation"]).map((k, v) => MapEntry<String, int>(k, v)),
    gender: json["Gender"] == null ? null : Gender.fromJson(json["Gender"]),
    lastData: json["LastData"] == null ? null : DateTime.parse(json["LastData"]),
    updateDate: json["UpdateDate"] == null ? null : json["UpdateDate"],
    source: json["Source"] == null ? null : json["Source"],
    devBy: json["DevBy"] == null ? null : json["DevBy"],
    severBy: json["SeverBy"] == null ? null : json["SeverBy"],
  );

  Map<String, dynamic> toJson() => {
    "Province": province == null ? null : Map.from(province).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "Nation": nation == null ? null : Map.from(nation).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "Gender": gender == null ? null : gender.toJson(),
    "LastData": lastData == null ? null : lastData.toIso8601String(),
    "UpdateDate": updateDate == null ? null : updateDate,
    "Source": source == null ? null : source,
    "DevBy": devBy == null ? null : devBy,
    "SeverBy": severBy == null ? null : severBy,
  };
}

class Gender {
  Gender({
    this.female,
    this.male,
    this.unknown,
  });

  int female;
  int male;
  int unknown;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    female: json["Female"] == null ? null : json["Female"],
    male: json["Male"] == null ? null : json["Male"],
    unknown: json["Unknown"] == null ? null : json["Unknown"],
  );

  Map<String, dynamic> toJson() => {
    "Female": female == null ? null : female,
    "Male": male == null ? null : male,
    "Unknown": unknown == null ? null : unknown,
  };
}
