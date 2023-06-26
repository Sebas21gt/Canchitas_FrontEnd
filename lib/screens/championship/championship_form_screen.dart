import 'dart:convert';
import 'dart:io';

import 'package:canchitas/screens/team/team_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';

class ChampionshipFormScreen extends StatelessWidget {
  const ChampionshipFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Encabezado(),
            RegisterChampionshipForm(),
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
      height: size.height * 0.20,
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
          const SizedBox(height: 9),
          Center(
            child: Text(
              "Registrar un Campeonato",
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

Items item1 = Items(
  title: "Futbol",
);

Items item2 = Items(
  title: "Futsal",
);

Items item3 = Items(
  title: "VoleyBall",
);

Items item4 = Items(
  title: "BasketBall",
);

class RegisterChampionshipForm extends StatefulWidget {
  const RegisterChampionshipForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterChampionshipForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameChampionshipController = TextEditingController();
  final _dateStartController = TextEditingController();
  final _dateFinishController = TextEditingController();
  final _disciplineController = TextEditingController();
  List<Items> listDisciplinas = [item1, item2, item3, item4];

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
                  controller: _nameChampionshipController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Nombre del Campeonato",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese el nombre del campeonato",
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
                  controller: _dateStartController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Fecha de Inicio",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese la fecha de inicio",
                    hintStyle: TextStyle(
                        color: cTextColor,
                        fontFamily: "SportsBar",
                        fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.date_range_rounded,
                      color: cPrimaryColor,
                    ),
                  ),
                  onTap: () {
                    _callDatePickerStart();
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _dateFinishController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Fecha de Finalizacion",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese la fecha de finalizacion",
                    hintStyle: TextStyle(
                        color: cTextColor,
                        fontFamily: "SportsBar",
                        fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.date_range_rounded,
                      color: cPrimaryColor,
                    ),
                  ),
                  onTap: () {
                    _callDatePickerFinish();
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Disciplina",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Seleccione una disciplina",
                    hintStyle: TextStyle(
                        color: cTextColor,
                        fontFamily: "SportsBar",
                        fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.sports,
                      color: cPrimaryColor,
                    ),
                  ),
                  items: listDisciplinas
                      .map((item) => DropdownMenuItem<String>(
                            child: Text(item.title),
                            value: item.title,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _disciplineController.text = value!;
                    });
                  },
                ),
                const SizedBox(height: 40),
                _CustomButton(
                  text: "Registrarse",
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                  colorBackground: cPrimaryColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _registerChampionship();
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

  void _callDatePickerStart() async {
    var selectedDate = await getDatePickerStart();
    setState(() {
      _dateStartController.text = selectedDate.toString();
    });
  }

  void _callDatePickerFinish() async {
    var selectedDate = await getDatePickerFinish();
    setState(() {
      _dateFinishController.text = selectedDate.toString();
    });
  }

  Future<DateTime?> getDatePickerStart() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: cPrimaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  Future<DateTime?> getDatePickerFinish() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: cPrimaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  void _registerChampionship() async {
  try {
    String url = 'http://192.168.66.30:8080/championship';
    var body = {
      "name": _nameChampionshipController.text,
      "startDate": _formatDateTime(_dateStartController.text),
      "finalDate": _formatDateTime(_dateFinishController.text),
      "disciplineId": _getDisciplineId(_disciplineController.text),
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
            title: const Text('Registro Exitoso'),
            content: const Text('El campeonato se registró correctamente.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/championship');
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
      print("Error en el registro");
    }
  }
}


  String _formatDateTime(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(parsedDateTime);
    return formattedDateTime;
  }

  int _getDisciplineId(String discipline) {
    if (discipline == "Futbol") {
      return 1;
    } else if (discipline == "VoleyBall") {
      return 2;
    } else if (discipline == "BasketBall") {
      return 3;
    } else if (discipline == "Futsal") {
      return 4;
    }
    return 0;
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
