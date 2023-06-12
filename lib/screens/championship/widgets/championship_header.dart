import 'package:canchitas/controllers/user_service.dart';
import 'package:canchitas/models/model_disciplines.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ChampionshipsHeader extends StatefulWidget {
  const ChampionshipsHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ChampionshipsHeader> createState() => _ChampionshipsHeaderState();
}

class _ChampionshipsHeaderState extends State<ChampionshipsHeader> {
  List<ModelDisciplines>? _modelDisciplines;
  ModelDisciplines? _selectedDiscipline;

  @override
  void initState() {
    super.initState();// Obtener los campeonatos al cargar el widget
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: widget.size.height * 0.15,
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
                      color: cPrimaryColor, fontSize: 50, fontFamily: 'SportsBar'),
                  textAlign: TextAlign.start,
              ),
              const Spacer(),
              Image.asset("assets/icons/championship.png", height: 80, width: 80),
            ],
          ),
        ],
      ),
    );
  }
}