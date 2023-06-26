import 'dart:convert';
import 'dart:io';
import 'package:canchitas/controllers/user_service.dart';
import 'package:canchitas/models/model_championship.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class ProgrammingFormScreen extends StatelessWidget {
  const ProgrammingFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: cBackgroundColor,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (kDebugMode) {
              print("Back");
            }
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: cPrimaryColor,
      ),
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
      padding: const EdgeInsets.only(top: 10),
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
          Center(
            child: Text(
              "Generar \nProgramacion",
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

class RegisterChampionshipForm extends StatefulWidget {
  const RegisterChampionshipForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterChampionshipForm> {
  final _formKey = GlobalKey<FormState>();
  List<ModelChampionship>? _modelChampionship;
  ModelChampionship? _selectedChampionship;

  final _numGroupsChampionshipController = TextEditingController();
  final _dateFinishController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getChampionships(); // Obtener los campeonatos al cargar el widget
  }

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
                  controller: _dateFinishController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Fecha de Programación",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese la fecha de programación",
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
                DropdownButtonFormField<ModelChampionship>(
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
                  onChanged: (ModelChampionship? selectedChampionship) {
                    setState(() {
                      _selectedChampionship = selectedChampionship;
                    });
                  },
                  items: buildDropdownItems(),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _numGroupsChampionshipController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Numero de grupos",
                    labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                    hintText: "Ingrese la cantidad de grupos",
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
                const SizedBox(height: 40),
                _CustomButton(
                  text: "Generar Programación",
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                  colorBackground: cPrimaryColor,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _registerProgramming();
                    }
                    setState(() {});
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> getChampionships() async {
    try {
      _modelChampionship = await UserService().getChampionships();
    } catch (e) {
      // Manejar el error de la solicitud
    }
  }

  List<DropdownMenuItem<ModelChampionship>> buildDropdownItems() {
    return _modelChampionship?.map((championship) {
          return DropdownMenuItem<ModelChampionship>(
            value: championship,
            child: Text(championship.name ?? ''),
          );
        }).toList() ??
        [];
  }

  void _callDatePickerFinish() async {
    var selectedDate = await getDatePickerFinish();
    setState(() {
      _dateFinishController.text = selectedDate.toString();
    });
  }

  Future<DateTime?> getDatePickerFinish() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return (Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: cPrimaryColor,
            ),
          ),
          child: child!,
        ));
      },
    );
  }

  void _registerProgramming() async {
    final String date = _dateFinishController.text;
    final int championshipId = _selectedChampionship?.id ?? 0;
    final int group = int.tryParse(_numGroupsChampionshipController.text) ?? 0;
    print(date);
    print(championshipId);
    print(group);

    if (_selectedChampionship == null) {
      // No se ha seleccionado un campeonato
      return;
    } // Obtener el ID del campeonato seleccionado

    try {
      final url = 'http://192.168.66.30:8080/programming';
      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      var body = <String, dynamic>{
        'date': date,
        'championshipId': championshipId,
        'group': group,
      };
      final dio = Dio();
      final response = await dio.post(
        url,
        data: jsonEncode(body),
        options: Options(headers: headers),
      );
      if (kDebugMode) {
        print(response.statusCode);
      }
      //!Cambiar en el backend el status code de 201 a 200
      if (response.statusCode == 201) {
        // La solicitud fue exitosa
        var data = response.data;
        // ignore: avoid_print
        print(data);
        // _showAlert
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Registro exitoso"),
                content: Text("Se ha registrado la programación exitosamente"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/programming');
                    },
                    child: Text("Aceptar"),
                  ),
                ],
              );
            });
        // Navigator.pushNamed(context, '/menu');
        // Maneja la respuesta de la API aquí
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print("Error en el registro");
      }
    }
  }
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