import 'package:canchitas/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    //Nos proporcionara todo el ancho y largo de la pantalla
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          //Usara el 75% de toda la pantalla
          height: size.height * 0.75,
          child: Stack(children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: cdefaultPadding, right: cdefaultPadding, bottom: 250),
              height: size.height * 0.75 - 70,
              decoration: const BoxDecoration(
                  color: cPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child: Row(
                children: <Widget>[
                  Text(
                    "BIENVENIDO A \nLAS CANCHITAS!",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 80,
                        fontFamily: 'SportsBar',
                      ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: cdefaultPadding),
                  height: 250,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo_1.png"))),
                )
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: cdefaultPadding, right: cdefaultPadding, bottom: 250),
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                  color: cPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child: Row(
                children: <Widget>[
                  Text(
                    "BIENVENIDO A \nLAS CANCHITAS!",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 80,
                        fontFamily: 'SportsBar',
                      ),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
