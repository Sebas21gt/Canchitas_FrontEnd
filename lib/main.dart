import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/home/home_screen.dart';
import 'package:canchitas/screens/intro/intro_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canchitas App',
      theme: ThemeData(
        fontFamily: 'SportsBar',
        scaffoldBackgroundColor: cBackgroundColor,
        primaryColor: cPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: cTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const IntroScreen(),

    );
  }
}