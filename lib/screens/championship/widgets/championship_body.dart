import 'package:canchitas/constants.dart';
import 'package:flutter/material.dart';

class ChampionshipBody extends StatelessWidget {
  const ChampionshipBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: size.height * 0.637,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: cPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const ListTile(
                leading: Icon(Icons.sports_soccer),
                title: Text('Campeonato 1'),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const ListTile(
                leading: Icon(Icons.sports_soccer),
                title: Text('Campeonato 2'),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: Icon(Icons.sports_soccer),
                title: Text('Campeonato 3'),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                  print("Campeonato 3");
                },
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: cBackgroundColor,
                  onPrimary: cPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
                child: const ListTile(
                  leading: Icon(Icons.sports_soccer),
                  title: Text('Campeonato 4'),
                ),
              ),
            )
          ],
        ));
  }
}
