import 'dart:convert';

import 'package:canchitas/models/model_championship.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class UserService {
  Future getChampionships() async {
    try {
      final url = 'http://192.168.1.54:8080/championship';
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
      }
    } catch (e) {
      print(e);
    }
  }
}
