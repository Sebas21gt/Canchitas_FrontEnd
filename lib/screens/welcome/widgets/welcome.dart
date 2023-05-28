import 'package:flutter/material.dart';

import '../../../constants.dart';

class Welcome extends StatelessWidget {
  const Welcome({
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
                color: Colors.white, fontSize: 55, fontFamily: 'SportsBar'),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 40),
          Text(
            "Encuentra torneos, reserva \ncanchas y mantente al tanto de \nlos campeonatos en tu área. \n¡No te pierdas ningún juego!",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'SportsBar',
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 40),
          Image.asset(
            "assets/images/logo_1.png",
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}