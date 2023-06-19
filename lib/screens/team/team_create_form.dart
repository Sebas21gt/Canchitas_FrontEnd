import 'dart:convert';
import 'dart:io';

import 'package:canchitas/screens/team/team_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';

class TeamCreateForm extends StatelessWidget {
  const TeamCreateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Encabezado(),
            CreateTeamForm(),
          ],
        ),
      ),
    );
  }
}

class Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 40),
      height: size.height * 0.30,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: cPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Text(
              "Registrar \nun Equipo",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'SportsBar',
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CreateTeamForm extends StatefulWidget {
  const CreateTeamForm({Key? key}) : super(key: key);

  @override
  _CreateTeamFormState createState() => _CreateTeamFormState();
}

class _CreateTeamFormState extends State<CreateTeamForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _shieldPhotographyController = TextEditingController();
  final _delegateNameController = TextEditingController();

  int _selectedDiscipline =
      1; // Valor predeterminado de la disciplina seleccionada

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      height: size.height * 0.70,
      width: double.infinity,
      decoration: const BoxDecoration(color: cBackgroundColor),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Nombre del Equipo",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese el nombre del equipo",
                    hintStyle: TextStyle(
                        color: cTextColor,
                        fontFamily: "SportsBar",
                        fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.text_fields_rounded,
                      color: cPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _shieldPhotographyController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Fotografía del Escudo",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese la fotografía del escudo",
                    hintStyle: TextStyle(
                        color: cTextColor,
                        fontFamily: "SportsBar",
                        fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.image_rounded,
                      color: cPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _delegateNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Nombre del Delegado",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese el nombre del delegado",
                    hintStyle: TextStyle(
                        color: cTextColor,
                        fontFamily: "SportsBar",
                        fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.person_rounded,
                      color: cPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<int>(
                  value: _selectedDiscipline,
                  onChanged: (value) {
                    setState(() {
                      _selectedDiscipline = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Disciplina",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.sports_soccer_rounded,
                      color: cPrimaryColor,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text("Fútbol"),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text("VoleyBall"),
                    ),
                    DropdownMenuItem<int>(
                      value: 3,
                      child: Text("BasketBall"),
                    ),
                    DropdownMenuItem<int>(
                      value: 4,
                      child: Text("Futsal"),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _CustomButton(
                  text: "Crear Equipo",
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                  colorBackground: cPrimaryColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _createTeam();
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _createTeam() async {
    try {
      String url = 'http://192.168.1.54:8080/team';
      var body = {
        "name": _nameController.text,
        "shieldPhotography": _shieldPhotographyController.text,
        "delegateName": _delegateNameController.text,
        "disciplines": [_selectedDiscipline]
      };

      final dio = Dio();
      final response = await dio.post(
        url,
        data: jsonEncode(body),
      );

      if (kDebugMode) {
        print(response.statusCode);
      }

      if (response.statusCode == 201) {
        // La solicitud fue exitosa
        var data = response.data;
        // ignore: avoid_print
        print(data);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Equipo Creado'),
              content: const Text('El equipo se ha creado correctamente.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/team');
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print("Error al crear el equipo");
      }
    }
  }
}

class Items {
  String title;
  Items({
    required this.title,
  });
}

class _CustomButton extends StatelessWidget {
  final String text;
  final Color colorBorder;
  final Color colorText;
  final Color colorBackground;
  final Function()? onTap;

  const _CustomButton({
    Key? key,
    required this.text,
    required this.colorBorder,
    required this.colorText,
    required this.colorBackground,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(15),
          backgroundColor: MaterialStateProperty.all(colorBackground),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: colorBorder, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "SportsBar",
            fontSize: 20,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
