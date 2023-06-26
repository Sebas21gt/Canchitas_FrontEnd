import 'package:canchitas/constants.dart';
import 'package:canchitas/models/model_view_programming.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProgrammingBody extends StatefulWidget {
  ProgrammingBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ProgrammingBody> createState() => _ProgrammingBodyState();
}

class _ProgrammingBodyState extends State<ProgrammingBody> {
  List<ModelViewProgramming> matches = [];
  // Lista para almacenar los partidos obtenidos
  Future<void> fetchMatches() async {
    final dio = Dio();
    try {
      final response = await dio
          .get('http://192.168.66.30:8080/programming/view-programming-date/5/1');
      final responseData = response.data;

      if (response.statusCode == 200) {
        final data = responseData['data'] as List<dynamic>;

        matches = data.map((item) {
          return ModelViewProgramming(
            groupName: item['groupName'],
            dateNumber: item['dateNumber'],
            teamOneName: item['teamOneName'],
            teamTwoName: item['teamTwoName'],
            date: item['date']
          );
        }).toList();
      } else {
        CircularProgressIndicator();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMatches(); // Obtener los campeonatos al cargar el widget
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: widget.size.height * 0.737,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: cPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: cPrimaryColor,
                  child: Icon(Icons.shield, color: Colors.white),
                ),
                subtitle: Text('Fecha ${match.dateNumber} | Serie ${match.groupName} | Hora ${match.date}'),
                title: Text('${match.teamOneName} vs ${match.teamTwoName}'),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
              ),
            ),
          );
        },
      ),
    );
  }
}