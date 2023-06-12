import 'package:canchitas/constants.dart';
import 'package:canchitas/controllers/user_service.dart';
import 'package:canchitas/models/model_championship.dart';
import 'package:canchitas/models/model_disciplines.dart';
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
  // late List<ModelChampionship> championships;
  List<ModelChampionship> championships = []; // Lista de campeonatos
  List<ModelDisciplines> disciplines = [];

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
              final discipline = disciplines.firstWhere(
                (discipline) => discipline.id == championship.disciplineId,
                orElse: () => ModelDisciplines(id: 0, name: 'Otra disciplina'),
              );
              // Asignar el icono según la disciplina
              IconData icon;
              if (discipline.name?.toLowerCase() == 'futbol') {
                icon = Icons.sports_soccer;
              } else if (discipline.name?.toLowerCase() == 'voley') {
                icon = Icons.sports_volleyball;
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
                  subtitle: Text(discipline.name!),
                  onTap: () {
                    print("Obtener nombres de equipos");
                  }, // Mostrar la disciplina como subtítulo
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
