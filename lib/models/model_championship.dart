// To parse this JSON data, do
//
//     final modelChampionship = modelChampionshipFromJson(jsonString);

import 'dart:convert';

List<ModelChampionship> modelChampionshipFromJson(String str) => List<ModelChampionship>.from(json.decode(str).map((x) => ModelChampionship.fromJson(x)));

String modelChampionshipToJson(List<ModelChampionship> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelChampionship {
    int? id;
    String? userCreation;
    String? userUpdate;
    DateTime? dateCreation;
    DateTime? dateUpdate;
    String? name;
    DateTime? startDate;
    DateTime? finalDate;
    int? status;
    int? disciplineId;

    ModelChampionship({
        this.id,
        this.userCreation,
        this.userUpdate,
        this.dateCreation,
        this.dateUpdate,
        this.name,
        this.startDate,
        this.finalDate,
        this.status,
        this.disciplineId,
    });

    factory ModelChampionship.fromJson(Map<String, dynamic> json) => ModelChampionship(
        id: json["id"],
        userCreation: json["userCreation"],
        userUpdate: json["userUpdate"],
        dateCreation: DateTime.parse(json["dateCreation"]),
        dateUpdate: DateTime.parse(json["dateUpdate"]),
        name: json["name"],
        startDate: DateTime.parse(json["startDate"]),
        finalDate: DateTime.parse(json["finalDate"]),
        status: json["status"],
        disciplineId: json["disciplineId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userCreation": userCreation,
        "userUpdate": userUpdate,
        "dateCreation": dateCreation?.toIso8601String(),
        "dateUpdate": dateUpdate?.toIso8601String(),
        "name": name,
        "startDate": startDate?.toIso8601String(),
        "finalDate": finalDate?.toIso8601String(),
        "status": status,
        "disciplineId": disciplineId,
    };
}
