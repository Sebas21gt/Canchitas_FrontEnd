import 'package:canchitas/constants.dart';
import 'package:canchitas/models/model_championship.dart';
import 'package:canchitas/models/model_disciplines.dart';
import 'package:flutter/material.dart';

import 'controllers/user_service.dart';

class testScreem extends StatelessWidget {
  const testScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: testBody(),
    );
  }
}

class testBody extends StatefulWidget {
  const testBody({
    Key? key,
  }) : super(key: key);

  @override
  State<testBody> createState() => _testBodyState();
}

class _testBodyState extends State<testBody> {
  List<ModelDisciplines>? _modelDisciplines;
  ModelDisciplines? _selectedDiscipline;

  @override
  void initState() {
    super.initState();
    getDisciplines(); // Obtener los campeonatos al cargar el widget
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButtonFormField<ModelDisciplines>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: cPrimaryColor, width: 20),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: "Campeonato",
              labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
              hintText: "Seleccione un campeonato",
              hintStyle: TextStyle(
                color: cTextColor,
                fontFamily: "SportsBar",
                fontSize: 18,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(
                Icons.sports,
                color: cPrimaryColor,
              ),
            ),
            onChanged: (ModelDisciplines? selectedChampionship) {
              setState(() {
                _selectedDiscipline = selectedChampionship;
              });
            },
            items: buildDropdownItems(),
          ),
        ],
      ),
    );
  }

  Future<void> getDisciplines() async {
    try {
      _modelDisciplines = await UserService().getDisciplines();
    } catch (e) {
      // Manejar el error de la solicitud
    }
  }

  List<DropdownMenuItem<ModelDisciplines>> buildDropdownItems() {
    return _modelDisciplines?.map((championship) {
          return DropdownMenuItem<ModelDisciplines>(
            value: championship,
            child: Text(championship.name ?? ''),
          );
        }).toList() ??
        [];
  }
}

