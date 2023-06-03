import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/sports/widgets/griddashboard.dart';
import 'package:flutter/material.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: cBackgroundColor,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: cPrimaryColor,
        title: Text("Canchitas App",
            style: TextStyle(
                fontFamily: "SportsBar",
                fontSize: 30,
                color: cBackgroundColor)),
        centerTitle: true,
      ),
      body: Sports(),
    );
  }
}

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
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
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("DEPORTES",
                  style: TextStyle(
                    fontFamily: "SportsBar",
                    fontSize: 40,
                    color: cPrimaryColor)
                ),
                SizedBox(height: 4),
                Text("Que deporte desea buscar?",
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