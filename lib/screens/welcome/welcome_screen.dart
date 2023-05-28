import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/welcome/widgets/register_login_buttons.dart';
import 'package:canchitas/screens/welcome/widgets/welcome.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _CustomBody(),
    );
  }
}

class _CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      Welcome(size: size),
      RegisterLoginButtons(size: size),
    ]);
  }
}

