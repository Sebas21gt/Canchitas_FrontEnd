import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/sports/widgets/fusal_header.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FutsalScreen extends StatelessWidget {
  const FutsalScreen({super.key});

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
        actions: [
          IconButton(
            color: cBackgroundColor,
            iconSize: 40,
            icon: const Icon(Icons.playlist_add_outlined),
            onPressed: () {
              Navigator.pushNamed(context, "/championship_form");
            },
          ),
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
      FutsalHeader(size: size),
      // FutsalHeader2(size: size),
    ]);
  }
}