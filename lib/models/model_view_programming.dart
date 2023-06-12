// To parse this JSON data, do
//
//     final modelViewProgramming = modelViewProgrammingFromJson(jsonString);

import 'dart:convert';

List<ModelViewProgramming> modelViewProgrammingFromJson(String str) => List<ModelViewProgramming>.from(json.decode(str).map((x) => ModelViewProgramming.fromJson(x)));

String modelViewProgrammingToJson(List<ModelViewProgramming> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelViewProgramming {
    String? groupName;
    int? dateNumber;
    String? teamOneName;
    String? teamTwoName;
    String? date;

    ModelViewProgramming({
        this.groupName,
        this.dateNumber,
        this.teamOneName,
        this.teamTwoName,
        this.date,
    });

    factory ModelViewProgramming.fromJson(Map<String, dynamic> json) => ModelViewProgramming(
        groupName: json["groupName"],
        dateNumber: json["dateNumber"],
        teamOneName: json["teamOneName"],
        teamTwoName: json["teamTwoName"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "groupName": groupNameValues.reverse[groupName],
        "dateNumber": dateNumber,
        "teamOneName": teamOneName,
        "teamTwoName": teamTwoName,
        "date": date,
    };
}

enum GroupName { SERIE_1, SERIE_2 }

final groupNameValues = EnumValues({
    "Serie 1": GroupName.SERIE_1,
    "Serie 2": GroupName.SERIE_2
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
