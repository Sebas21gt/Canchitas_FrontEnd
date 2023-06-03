import 'package:flutter/material.dart';
import '../../../constants.dart';

class ChampionshipsHeader extends StatelessWidget {
  const ChampionshipsHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: size.height * 0.25,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: cBackgroundColor,
          // borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(35),
          //     bottomRight: Radius.circular(35))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                  "CAMPEONATOS",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: cPrimaryColor, fontSize: 40, fontFamily: 'SportsBar'),
                  textAlign: TextAlign.start,
              ),
              const Spacer(),
              Image.asset("assets/icons/championship.png", height: 80, width: 80),
            ],
          ),
          const SizedBox(height: 40),
          DropdownButtonFormField(
            items: ["FUTBOL", "FUTSAL", "VOLEYBALL", "BASKETBALL"].map((String category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              print(value);
            },
            iconEnabledColor: Colors.white,
            icon: const Icon(Icons.arrow_drop_down_circle),
            dropdownColor: cPrimaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: cPrimaryColor,
              suffixStyle: TextStyle(color: cBackgroundColor),
              floatingLabelStyle: TextStyle(color: cPrimaryColor),
              hintText: "CATEGORIA",
              hintStyle: const TextStyle(color: cBackgroundColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}