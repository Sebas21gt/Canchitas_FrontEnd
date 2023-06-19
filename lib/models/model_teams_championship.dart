// To parse this JSON data, do
//
//     final modelTeamsChampionship = modelTeamsChampionshipFromJson(jsonString);

import 'dart:convert';

List<ModelTeamsChampionship> modelTeamsChampionshipFromJson(String str) => List<ModelTeamsChampionship>.from(json.decode(str).map((x) => ModelTeamsChampionship.fromJson(x)));

String modelTeamsChampionshipToJson(List<ModelTeamsChampionship> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelTeamsChampionship {
    int? id;
    String? userCreation;
    String? userUpdate;
    DateTime? dateCreation;
    DateTime? dateUpdate;
    int? teamId;
    int? championshipId;
    int? group;

    ModelTeamsChampionship({
        this.id,
        this.userCreation,
        this.userUpdate,
        this.dateCreation,
        this.dateUpdate,
        this.teamId,
        this.championshipId,
        this.group,
    });

    factory ModelTeamsChampionship.fromJson(Map<String, dynamic> json) => ModelTeamsChampionship(
        id: json["id"],
        userCreation: json["userCreation"],
        userUpdate: json["userUpdate"],
        dateCreation: DateTime.parse(json["dateCreation"]),
        dateUpdate: DateTime.parse(json["dateUpdate"]),
        teamId: json["teamId"],
        championshipId: json["championshipId"],
        group: json["group"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userCreation": userCreation,
        "userUpdate": userUpdate,
        "dateCreation": dateCreation?.toIso8601String(),
        "dateUpdate": dateUpdate?.toIso8601String(),
        "teamId": teamId,
        "championshipId": championshipId,
        "group": group,
    };
}
