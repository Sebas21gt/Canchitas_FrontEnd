import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/championship/championship_form_screen.dart';
import 'package:canchitas/screens/championship/championship_screen.dart';
import 'package:canchitas/screens/home/home_screen.dart';
import 'package:canchitas/screens/menu/menu_screen.dart';
import 'package:canchitas/screens/programming/programming_assing_date_form_screen.dart';
import 'package:canchitas/screens/programming/programming_form_screen.dart';
import 'package:canchitas/screens/programming/programming_screen.dart';
import 'package:canchitas/screens/sports/futsal_screen.dart';
import 'package:canchitas/screens/sports/sports_screen.dart';
import 'package:canchitas/screens/team/team_screen.dart';
import 'package:canchitas/screens/welcome/intro_screen.dart';
import 'package:canchitas/screens/welcome/login_screen.dart';
import 'package:canchitas/screens/welcome/register_screen.dart';
import 'package:canchitas/test.dart';
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
        "/championship_form":(context) => const ChampionshipFormScreen(),
        "/programming":(context) => const ProgrammingScreen(),
        "/programming_form":(context) => const ProgrammingFormScreen(),
        "/programming_assing_date_form":(context) => const ProgrammingAssingDateFormScreen(),
        "/sports":(context) => const SportsScreen(),
        "/futsal":(context) => const FutsalScreen(),

        "/test":(context) => const testScreem(), // TODO: Delete this
      },
      // initialRoute: "/welcome",
      initialRoute: "/menu",
    );
  }
}