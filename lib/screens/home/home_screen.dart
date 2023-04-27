import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/home/widgets/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: cPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset("assets/icons/burger-menu.png"),
        onPressed: () {
          print("Prueba Boton");
        },
      ),
    );
  }
}
