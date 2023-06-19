// To parse this JSON data, do
//
//     final modelTeams = modelTeamsFromJson(jsonString);

import 'dart:convert';

List<ModelTeams> modelTeamsFromJson(String str) => List<ModelTeams>.from(json.decode(str).map((x) => ModelTeams.fromJson(x)));

String modelTeamsToJson(List<ModelTeams> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelTeams {
    int? id;
    String? userCreation;
    String? userUpdate;
    DateTime? dateCreation;
    DateTime? dateUpdate;
    String? name;
    ShieldPhotography? shieldPhotography;
    DelegateName? delegateName;
    int? status;

    ModelTeams({
        this.id,
        this.userCreation,
        this.userUpdate,
        this.dateCreation,
        this.dateUpdate,
        this.name,
        this.shieldPhotography,
        this.delegateName,
        this.status,
    });

    factory ModelTeams.fromJson(Map<String, dynamic> json) => ModelTeams(
        id: json["id"],
        userCreation: json["userCreation"],
        userUpdate: json["userUpdate"],
        dateCreation: DateTime.parse(json["dateCreation"]),
        dateUpdate: DateTime.parse(json["dateUpdate"]),
        name: json["name"],
        shieldPhotography: shieldPhotographyValues.map[json["shieldPhotography"]],
        delegateName: delegateNameValues.map[json["delegateName"]],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userCreation": userCreation,
        "userUpdate": userUpdate,
        "dateCreation": dateCreation?.toIso8601String(),
        "dateUpdate": dateUpdate?.toIso8601String(),
        "name": name,
        "shieldPhotography": shieldPhotographyValues.reverse[shieldPhotography],
        "delegateName": delegateNameValues.reverse[delegateName],
        "status": status,
    };
}

enum DelegateName { DSADFDF, SEBAS }

final delegateNameValues = EnumValues({
    "DSADFDF": DelegateName.DSADFDF,
    "Sebas": DelegateName.SEBAS
});

enum ShieldPhotography { ESCUDO }

final shieldPhotographyValues = EnumValues({
    "Escudo": ShieldPhotography.ESCUDO
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
