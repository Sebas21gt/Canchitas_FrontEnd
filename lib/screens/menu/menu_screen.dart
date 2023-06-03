import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/menu/widgets/griddashboard.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: cBackgroundColor,
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            showDialog(
              context: context, 
              builder: (context) => AlertDialog(
                title: const Text("Información"),
                content: const Text("Demo desarrollado para la materia de Taller de especialidad\nEstudiante:\n- Sebastian Gonzales Tito\nCodigo Fuente:\n-https://github.com/sebas21gt/canchitasFrontEnd"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), 
                    child: const Text("Ok", style: TextStyle(color: cPrimaryColor)
                  ))
                ],
              ));
          },
        ),
        elevation: 0,
        backgroundColor: cPrimaryColor,
        title: const Text("Canchitas App",
            style: TextStyle(
                fontFamily: "SportsBar",
                fontSize: 30,
                color: cBackgroundColor)),
        centerTitle: true,
      ),
      body: const Menu(),
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
    return const Scaffold(
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
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
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
                          color: cPrimaryColor)),
                  SizedBox(height: 4),
                  Text("Que desea hacer hoy?",
                      style: TextStyle(
                          fontFamily: "SportsBar",
                          fontSize: 20,
                          color: cPrimaryColor)),
                ],
              ),
              IconButton(
                alignment: Alignment.topCenter,
                icon: const Icon(Icons.notifications_none,
                    size: 30, color: cPrimaryColor),
                onPressed: () {},
              )
            ],
          ),
        ),
        const SizedBox(height: 40),
        GridDashboard(),
      ],
    );
  }
}
