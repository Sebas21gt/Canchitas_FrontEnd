import 'package:canchitas/screens/programming/widgets/programming_body.dart';
import 'package:canchitas/screens/programming/widgets/programming_header.dart';
import 'package:flutter/material.dart';
import 'package:canchitas/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProgrammingScreen extends StatelessWidget {
  const ProgrammingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: cPrimaryColor,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (kDebugMode) {
              print("Back");
            }
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: cBackgroundColor,
        actions: [
          IconButton(
            color: cPrimaryColor,
            iconSize: 40,
            icon: const Icon(Icons.playlist_add_outlined),
            onPressed: () {
              Navigator.pushNamed(context, "/programming_form");
            },
          ),
          IconButton(
            color: cPrimaryColor,
            iconSize: 40,
            icon: const Icon(Icons.timer),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: _CustomBody(),
    );
  }
}

class _CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      ProgrammingHeader(size: size),
      ProgrammingBody(size: size),
    ]);
  }
}