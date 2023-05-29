import 'package:flutter/material.dart';
import '../../../constants.dart';

class ChampionshipsHeader extends StatelessWidget {
  const ChampionshipsHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: size.height * 0.25,
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
                  "CAMPEONATOS",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: cPrimaryColor, fontSize: 40, fontFamily: 'SportsBar'),
                  textAlign: TextAlign.start,
              ),
              const Spacer(),
              Image.asset("assets/icons/championship.png", height: 80, width: 80),
            ],
          ),
          const SizedBox(height: 40),
          // ignore: prefer_const_constructors
              ExpansionTile(
              title: const Text('DEPORTES', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'SportsBar')),
              collapsedBackgroundColor: cPrimaryColor,
              backgroundColor: cPrimaryColor,
              collapsedIconColor: cBackgroundColor,
              iconColor: cBackgroundColor,
              collapsedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text('FUTBOL', style: TextStyle(color: cBackgroundColor)),
                ),
                ListTile(
                  title: Text('FUTSAL', style: TextStyle(color: cBackgroundColor),),
                ),
                ListTile(
                  title: Text('VOLEYBALL', style: TextStyle(color: cBackgroundColor),),
                ),
                ListTile(
                  title: Text('BASKETBALL', style: TextStyle(color: cBackgroundColor),),
                ),
              ],
            ),
        ],
      ),
    );
  }
}