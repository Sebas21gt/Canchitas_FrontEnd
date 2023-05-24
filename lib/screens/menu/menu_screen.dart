import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/menu/griddashboard.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: _CustomBody(),
    );
  }
}

class _CustomBody extends StatelessWidget {
  const _CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 110),
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("INICIO",
                  style: TextStyle(
                    fontFamily: "SportsBar",
                    fontSize: 40,
                    color: cPrimaryColor)
                ),
                SizedBox(height: 4),
                Text("Que desea hacer hoy?",
                  style: TextStyle(
                    fontFamily: "SportsBar",
                    fontSize: 20,
                    color: cPrimaryColor)
                ),
              ],
            ),
            IconButton(
              alignment: Alignment.topCenter,
              icon: const Icon(Icons.notifications_none, size: 30, color: cPrimaryColor),
              onPressed: () {},
            )
          ],
        ), 
      ),
      SizedBox(height: 40),
      GridDashboard(),
    ],);
  }
}