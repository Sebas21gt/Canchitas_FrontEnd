import 'package:canchitas/constants.dart';
import 'package:canchitas/controllers/user_service.dart';
import 'package:canchitas/models/model_championship.dart';
import 'package:canchitas/models/model_disciplines.dart';
import 'package:canchitas/models/model_teams_championship.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChampionshipBody extends StatefulWidget {
  const ChampionshipBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ChampionshipBody> createState() => _ChampionshipBodyState();
}

class _ChampionshipBodyState extends State<ChampionshipBody> {
  List<ModelChampionship> championships = []; // Lista de campeonatos
  List<ModelDisciplines> disciplines = [];

  late String disciplineName;

  @override
  void initState() {
    super.initState();
    fetchChampionships();
  }

  Future<void> fetchChampionships() async {
    try {
      championships = await UserService().getChampionships();
    } catch (e) {
      // Manejar el error al cargar los campeonatos
      print('Error al cargar los campeonatos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: widget.size.height * 0.737,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: cPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: championships.length,
            itemBuilder: (context, index) {
              final championship = championships[index];
              // Buscar la disciplina por ID
              final discipline = championships[index].disciplineId!;
              // Asignar el icono según la disciplina
              IconData icon;

              if (discipline == 1) {
                icon = Icons.sports_soccer;
                disciplineName = "Fútbol";
              } else if (discipline == 2) {
                icon = Icons.sports_volleyball;
                disciplineName = "Voleyball";
              } else if (discipline == 3) {
                icon = Icons.sports_basketball;
                disciplineName = "Basketball";
              } else if (discipline == 4) {
                icon = Icons.sports_soccer;
                disciplineName = "Futsal";
              } else {
                icon = Icons.sports;
              }

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ListTile(
                  leading: Icon(icon),
                  title: Text(championship.name!),
                  subtitle: Text(disciplineName),
                  onTap: () {
                    getTeamNames(championship.id!);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void getTeamNames(int championshipId) async {
    try {
      String url =
          'http://192.168.1.54:8080/team/getTeamsChampionship/$championshipId';
      Dio dio = Dio();
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> teamsData = response.data['data'];

        Set<int> teamIds = teamsData.map<int>((teamData) {
          if (teamData.containsKey('id')) {
            return teamData['teamId'];
          } else {
            return 0;
          }
        }).toSet();

        // Obtener los nombres de los equipos a partir de los IDs
        List<String> teamNames = await fetchTeamNames(teamIds);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Nombres de equipos'),
              content: Column(
                children: teamNames.map((teamName) => Text(teamName)).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
      } else {
        print(
            'Error al obtener los equipos del campeonato. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener los nombres de los equipos: $e');
    }
  }

  Future<List<String>> fetchTeamNames(Set<int> teamIds) async {
    try {
      String url = 'http://192.168.1.54:8080/team/';
      Dio dio = Dio();
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> teamsData = response.data['data'];

        List<String> teams = [];
        for (var teamData in teamsData) {
          if (teamData.containsKey('id') && teamData.containsKey('name')) {
            int teamId = teamData['id'];
            String teamName = teamData['name'];

            if (teamIds.contains(teamId)) {
              String teamInfo = teamName;
              teams.add(teamInfo);
            }
          }
        }

        return teams;
      } else {
        print(
            'Error al obtener los equipos. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener los nombres de los equipos: $e');
    }

    return []; // Retorna una lista vacía en caso de error
  }
}
