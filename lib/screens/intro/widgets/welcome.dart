import 'package:canchitas/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(children: [
        Container(
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
              Text("BIENVENIDO A \nLAS CANCHITAS!",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 85,
                        fontFamily: 'SportsBar',
                      )
              ),
              const SizedBox(height: 40),
              Text("Encuentra torneos, reserva \ncanchas y mantente al tanto de \nlos campeonatos en tu área. \n¡No te pierdas ningún juego!",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'SportsBar',
                      )),
              const SizedBox(height: 40),
              Image.asset(
                "assets/images/logo_1.png",
                height: 230,
                width: 230,
              ),
            ],
          ),
        ),
        Container(
          height: size.height * 0.30,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: cBackgroundColor,
          ),
        ),
      ]),
    );
  }
}
