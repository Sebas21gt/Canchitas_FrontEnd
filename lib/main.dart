import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/championship/championship_screen.dart';
import 'package:canchitas/screens/home/home_screen.dart';
import 'package:canchitas/screens/menu/menu_screen.dart';
import 'package:canchitas/screens/team/team_screen.dart';
import 'package:canchitas/screens/welcome/intro_screen.dart';
import 'package:canchitas/screens/welcome/login_screen.dart';
import 'package:canchitas/screens/welcome/register_screen.dart';
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
      routes: {
        "/welcome": (context) => const IntroScreen(),
        "/home": (context) => const HomeScreen(),
        "/loginScreen": (context) => const LoginScreen(),
        "/registerScreen": (context) => const RegisterScreen(),
        "/menu":(context) => const MenuScreen(),
        "/team":(context) => const TeamScreen(),
        "/championship":(context) => const ChampionshipScreen(),
      },
      initialRoute: "/menu",
    );
  }
}