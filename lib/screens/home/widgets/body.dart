import 'dart:ui';

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
          //Usara el 20% de toda la pantalla
          height: size.height * 0.25,
          child: Stack(children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: cdefaultPadding, right: cdefaultPadding),
              height: size.height * 0.25 - 27,
              decoration: const BoxDecoration(
                  color: cPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child: Row(
                children: <Widget>[
                  Text(
                    "FUTBOL!!",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/icons/soccer-ball.png",
                    height: 50,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: cdefaultPadding),
                padding:
                    const EdgeInsets.symmetric(horizontal: cdefaultPadding),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 15),
                        blurRadius: 50,
                        color: cPrimaryColor.withOpacity(0.23),
                      ),
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Buscar Cancha",
                          hintStyle:
                              TextStyle(color: cPrimaryColor.withOpacity(0.5)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Image.asset("assets/icons/search.png")
                  ],
                ),
              ),
            )
          ]),
        )
      ],
    );
  }
}
