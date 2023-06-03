import 'package:canchitas/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> list = [
  {
    "image": "assets/images/football-player.png",
    "title": "Crear Equipo",
    "color": Colors.grey,
  },
  {
    "image": "assets/images/soccer_players.png",
    "title": "Unirse a Equipo",
    "color": cPrimaryColor,
  },
  {
    "image": "assets/images/versus_menu.png",
    "title": "Proximo Partido",
    "color": Colors.black,
  }
];

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: cBackgroundColor,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (kDebugMode) {
              print("Back");
            }
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: cPrimaryColor,
        actions: [
          Stack(children: [
            Container(
              padding: const EdgeInsets.only(right: 15, top: 15),
              child: const Icon(
                Icons.notifications,
                color: cBackgroundColor,
                size: 30,
              ),
            ),
            const Positioned(
              left: 15,
              bottom: 30,
              child: Icon(
                Icons.brightness_1,
                color: Colors.red,
                size: 10,
              ),
            )
          ]),
        ],
      ),
      body: const _CustomBody(),
    );
  }
}

class _CustomBody extends StatelessWidget {
  const _CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: list[index]["color"],
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    list[index]['image'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    list[index]['title'],
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ), 
          ),
        );
      },
      itemCount: list.length,
    );
  }
}