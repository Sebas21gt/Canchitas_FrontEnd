import 'package:canchitas/constants.dart';
import 'package:canchitas/controllers/user_service.dart';
import 'package:canchitas/models/model_championship.dart';
import 'package:flutter/material.dart';

class testScreem extends StatelessWidget {
  const testScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: testBody(),
    );
  }
}

class testBody extends StatefulWidget {
  const testBody({
    Key? key,
  }) : super(key: key);

  @override
  State<testBody> createState() => _testBodyState();
}

class _testBodyState extends State<testBody> {
  List<ModelChampionship>? _modelChampionship;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // for (var item in _modelChampionship!) Text(item.name!),
          DropdownButtonFormField(
            decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: cPrimaryColor, width: 20),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelText: "Campeonato",
            labelStyle: TextStyle(color: cPrimaryColor, fontSize: 20),
            hintText: "Seleccione un campeonato",
            hintStyle: TextStyle(
              color: cTextColor,
              fontFamily: "SportsBar",
              fontSize: 18),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(
              Icons.sports,
              color: cPrimaryColor,
            ),
            ),
            items: _modelChampionship!.map((ModelChampionship value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value.name!),
              );
            }).toList(),
            onChanged: (value) {},
            ),
          ElevatedButton(
            onPressed: () async {
              setState(() {});
            },
            child: const Text("Test"),
          ),
        ],
      ),
    );
  }
}
