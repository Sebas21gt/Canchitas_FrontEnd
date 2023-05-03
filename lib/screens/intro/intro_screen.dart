
import 'package:canchitas/screens/intro/widgets/body.dart';
import 'package:canchitas/screens/intro/widgets/welcome.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeScreen()
    );
  }
}
