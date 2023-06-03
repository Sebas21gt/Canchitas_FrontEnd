import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProgrammingHeader extends StatelessWidget {
  const ProgrammingHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: size.height * 0.15,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: cBackgroundColor,
          // borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(35),
          //     bottomRight: Radius.circular(35))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                  "PROGRAMACION \nDE PARTIDOS",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: cPrimaryColor, fontSize: 40, fontFamily: 'SportsBar'),
                  textAlign: TextAlign.start,
              ),
              const Spacer(),
              Image.asset("assets/icons/trophy.png", height: 80, width: 80),
            ],
          ),
          const SizedBox(height: 10),
          // ignore: prefer_const_constructors
        ],
      ),
    );
  }
}