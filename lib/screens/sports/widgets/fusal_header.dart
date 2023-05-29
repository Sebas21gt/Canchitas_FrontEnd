import 'package:flutter/material.dart';
import '../../../constants.dart';

class FutsalHeader extends StatelessWidget {
  const FutsalHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: size.height * 0.25,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: cPrimaryColor,
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                  "FUTSAL",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: cBackgroundColor, fontSize: 40, fontFamily: 'SportsBar'),
                  textAlign: TextAlign.start,
              ),
              const Spacer(),
              Image.asset("assets/icons/goal.png", height: 80, width: 80),
              
            ],
          ),
          const SizedBox(height: 30),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: cdefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: cdefaultPadding),
                height: 55,
                decoration: BoxDecoration(
                  color: cBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: cPrimaryColor.withOpacity(0.23),
                      spreadRadius: 1,
                      blurRadius: 50,
                      offset: const Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: cPrimaryColor, fontFamily: 'SportsBar', fontSize: 20),
                          hintText: "Buscar Cancha",
                          hintStyle: TextStyle(color: cPrimaryColor.withOpacity(0.7), fontFamily: 'SportsBar', fontSize: 20),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Image.asset("assets/icons/search.png", height: 60, width: 60, alignment: Alignment.centerRight,)
                  ],
                ),
              )
            )
        ],
      ),
    );
  }
}