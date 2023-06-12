// To parse this JSON data, do
//
//     final modelDisciplines = modelDisciplinesFromJson(jsonString);

import 'dart:convert';

List<ModelDisciplines> modelDisciplinesFromJson(String str) => List<ModelDisciplines>.from(json.decode(str).map((x) => ModelDisciplines.fromJson(x)));

String modelDisciplinesToJson(List<ModelDisciplines> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelDisciplines {
    int? id;
    String? userCreation;
    String? userUpdate;
    DateTime? dateCreation;
    DateTime? dateUpdate;
    String? name;
    String? description;
    int? status;

    ModelDisciplines({
        this.id,
        this.userCreation,
        this.userUpdate,
        this.dateCreation,
        this.dateUpdate,
        this.name,
        this.description,
        this.status,
    });

    factory ModelDisciplines.fromJson(Map<String, dynamic> json) => ModelDisciplines(
        id: json["id"],
        userCreation: json["userCreation"],
        userUpdate: json["userUpdate"],
        dateCreation: DateTime.parse(json["dateCreation"]),
        dateUpdate: DateTime.parse(json["dateUpdate"]),
        name: json["name"],
        description: json["description"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userCreation": userCreation,
        "userUpdate": userUpdate,
        "dateCreation": dateCreation?.toIso8601String(),
        "dateUpdate": dateUpdate?.toIso8601String(),
        "name": name,
        "description": description,
        "status": status,
    };
}
