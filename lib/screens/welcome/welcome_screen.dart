import 'package:canchitas/constants.dart';
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
      _RegisterLoginButtons(size: size),
    ]);
  }
}

class _RegisterLoginButtons extends StatelessWidget {
  const _RegisterLoginButtons({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
      height: size.height * 0.30,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: cBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _CustomButton(
                  text: "LOG IN",
                  colorBorder: cPrimaryColor,
                  colorText: cPrimaryColor,
                  colorBackground: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, "/loginScreen");
                  }),
              const SizedBox(width: 60),
              _CustomButton(
                  text: "Registrarse",
                  colorBorder: Colors.white,
                  colorText: Colors.white,
                  colorBackground: cPrimaryColor,
                  onTap: () {
                    Navigator.pushNamed(context, "/registerScreen");
                  }),
            ],
          )
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final Color colorBorder;
  final Color colorText;
  final Color colorBackground;
  final Function()? onTap;

  const _CustomButton({
    Key? key,
    required this.text,
    required this.colorBorder,
    required this.colorText,
    required this.colorBackground,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 130,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(15),
            backgroundColor: MaterialStatePropertyAll(colorBackground),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  side: BorderSide(color: colorBorder, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
            )),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "SportsBar",
            fontSize: 20,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
