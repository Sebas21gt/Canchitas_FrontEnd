import 'dart:convert';
import 'dart:io';

import 'package:canchitas/screens/team/team_screen.dart';
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

  final _nameChampionshipController = TextEditingController();
  final _dateStartController = TextEditingController();
  final _dateFinishController = TextEditingController();
  final _disciplineController = TextEditingController();

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
                const SizedBox(height: 20),
                DropdownButtonFormField(
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
                        fontSize: 18),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.sports,
                      color: cPrimaryColor,
                    ),
                  ),
                  items: ["Campeonato Barrio Max Toledo", "Asociacion Chuq. de Futsal", "Copa Promemba"]
                      .map((label) => DropdownMenuItem(
                            child: Text(label.toString()),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _nameChampionshipController,
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
}

void _registerChampionship() async {
  // try {
  //   String url = 'http://192.168.1.54:8080/user/register';
  //   var headers = {
  //     HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
  //   };
  //   var body = <String, dynamic>{
  //     "firstName": _firstNameController.text,
  //     "lastName": _lastNameController.text,
  //     "email": _emailController.text,
  //     "password": _passwordController.text,
  //   };
  //   final dio = Dio();
  //   final response = await dio.post(
  //     url,
  //     data: jsonEncode(body),
  //     options: Options(headers: headers),
  //   );
  //   if (kDebugMode) {
  //     print(response.statusCode);
  //   }
  //   if (response.statusCode == 201) {
  //     // La solicitud fue exitosa
  //     var data = response.data;
  //     // ignore: avoid_print
  //     print(data);
  //     Navigator.pushNamed(context, '/menu');
  //     // Maneja la respuesta de la API aquí
  //   }
  // } catch (e) {
  //   if (kDebugMode) {
  //     print(e);
  //     print("Error en el registro");
  //   }
  // }
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