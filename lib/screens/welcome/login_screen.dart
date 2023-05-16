import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _CustomBody(),
    );
  }
}

class _CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [Encabezado(size: size), LogInForm(size: size)]);
  }
}

class Encabezado extends StatelessWidget {
  const Encabezado({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      height: size.height * 0.40,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: cPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo_1.png",
            height: 150,
            width: 150,
          ),
          // const SizedBox(height: 20),
          Center(
            child: Text(
              "LAS CANCHITAS",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white, fontSize: 50, fontFamily: 'SportsBar'),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class LogInForm extends StatelessWidget {
  const LogInForm({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      height: size.height * 0.60,
      width: double.infinity,
      decoration: const BoxDecoration(color: cBackgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: cPrimaryColor, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Correo",
                  labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                  hintText: "Ingrese su correo",
                  hintStyle: TextStyle(
                      color: cTextColor, fontFamily: "SportsBar", fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(
                    Icons.mail_outline,
                    color: cPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Contraseña",
                  labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
                  hintText: "Ingrese su contraseña",
                  hintStyle: TextStyle(
                      color: cTextColor, fontFamily: "SportsBar", fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: cPrimaryColor,
                  ),
                  counterText: "Olvidé mi contraseña",
                  counterStyle: TextStyle(
                      color: cPrimaryColor, fontFamily: "SportsBar", fontSize: 18),
                  semanticCounterText: "Olvidé mi contraseña"
                ),
              ),
              const SizedBox(height: 80),
              _CustomButton(
                  text: "Iniciar Sesión",
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                  colorBackground: cPrimaryColor,
                  onTap: () {
                    Navigator.pushNamed(context, "/registerScreen");
                  }),
            ],
          )
        ],
      ),
    );
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
            elevation: const MaterialStatePropertyAll(15),
            backgroundColor: MaterialStatePropertyAll(colorBackground),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  side: BorderSide(color: colorBorder, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
            )),
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
