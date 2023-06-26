import 'dart:convert';

import 'package:canchitas/models/model_championship.dart';
import 'package:canchitas/models/model_disciplines.dart';
import 'package:canchitas/models/model_view_programming.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class UserService {
  Future<List<ModelChampionship>> getChampionships() async {
    try {
      final url = 'http://192.168.66.30:8080/championship';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // La solicitud fue exitosa
        var data = response.data;
        var list = (data as List)
            .map((map) => ModelChampionship.fromJson(map))
            .toList();
        // ModelChampionship modelChampionship = ModelChampionship.fromJson(data);
        // ignore: avoid_print
        return list;
      }else {
      throw Exception('La solicitud no fue exitosa: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
    throw Exception('Error en la solicitud de los campeonatos: $e');
  }
  }

  Future<List<ModelDisciplines>> getDisciplines() async {
    try {
      final url = 'http://192.168.66.30:8080/discipline';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // La solicitud fue exitosa
        var data = response.data;
        var list = (data as List)
            .map((map) => ModelDisciplines.fromJson(map))
            .toList();
        // ModelChampionship modelChampionship = ModelChampionship.fromJson(data);
        // ignore: avoid_print
        print(list.runtimeType);
        return list;
      }else {
        throw Exception('La solicitud no fue exitosa: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Error en la solicitud de los campeonatos: $e');
    }
  }
  
}
