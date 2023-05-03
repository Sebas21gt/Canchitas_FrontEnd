import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/home/widgets/body.dart';
import 'package:canchitas/screens/welcome/intro_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
    return Column(children: [
      _Welcome(size: size),
      _RegisterLoginButtons(size: size),
    ]);
  }
}

class _RegisterLoginButtons extends StatelessWidget {
  const _RegisterLoginButtons({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
      height: size.height * 0.30,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: cBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              _CustomButton(
                  text: "LOG IN",
                  colorBorder: cPrimaryColor,
                  colorText: cPrimaryColor,
                  colorBackground: Colors.white),
              SizedBox(width: 40),
              _CustomButton(
                  text: "Registrarse",
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                  colorBackground: cPrimaryColor),
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
  const _CustomButton({
    Key? key,
    required this.text,
    required this.colorBorder,
    required this.colorText,
    required this.colorBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 130,
      child: ElevatedButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => const Body()));
          print("Registrarse Button");
        },
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

class _Welcome extends StatelessWidget {
  const _Welcome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: size.height * 0.70,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: cPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            "BIENVENIDO A \nLAS CANCHITAS!",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white, fontSize: 50, fontFamily: 'SportsBar'),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 40),
          Text(
            "Encuentra torneos, reserva \ncanchas y mantente al tanto de \nlos campeonatos en tu área. \n¡No te pierdas ningún juego!",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'SportsBar',
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 40),
          Image.asset(
            "assets/images/logo_1.png",
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
