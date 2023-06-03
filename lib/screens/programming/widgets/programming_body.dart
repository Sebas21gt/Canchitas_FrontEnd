import 'package:canchitas/constants.dart';
import 'package:flutter/material.dart';

class ProgrammingBody extends StatelessWidget {
  const ProgrammingBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: size.height * 0.737,
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
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: cPrimaryColor,
                  child: Icon(Icons.shield, color: Colors.white)),
                title: const Text('Partido 1'),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
              )
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: cPrimaryColor,
                  child: Icon(Icons.shield, color: Colors.white)),
                title: const Text('Partido 2'),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
              )
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: cPrimaryColor,
                  child: Icon(Icons.shield, color: Colors.white)),
                title: const Text('Partido 3',),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: cPrimaryColor,
                  child: Icon(Icons.shield, color: Colors.white)),
                title: const Text('Partido 4'),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
              )
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: cPrimaryColor,
                  child: Icon(Icons.shield, color: Colors.white)),
                title: const Text('Partido 5'),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
              )
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: cPrimaryColor,
                  child: Icon(Icons.shield, color: Colors.white)),
                title: const Text('Partido 6'),
                onTap: () {
                  // Navigator.pushNamed(context, "/championshipScreen");
                },
              )
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}