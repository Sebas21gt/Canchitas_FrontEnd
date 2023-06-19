import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants.dart';

class FutsalScreen extends StatelessWidget {
  const FutsalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: cBackgroundColor,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: cPrimaryColor,
        actions: [
          IconButton(
            color: cBackgroundColor,
            iconSize: 40,
            icon: const Icon(Icons.playlist_add_outlined),
            onPressed: () {
              Navigator.pushNamed(context, "/championship_form");
            },
          ),
        ],
      ),
      body: _CustomBody(),
    );
  }
}

class _CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      FutsalHeader(size: size),
      Expanded(
        child: _GoogleMap(),
      ),
      // FutsalHeader2(size: size),
    ]);
  }
}

class FutsalHeader extends StatelessWidget {
  FutsalHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final TextEditingController searchController = TextEditingController();

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
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "FUTSAL",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: cBackgroundColor,
                      fontSize: 40,
                      fontFamily: 'SportsBar',
                    ),
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              Image.asset(
                "assets/icons/goal.png",
                height: 80,
                width: 80,
              ),
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
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: cPrimaryColor,
                          fontFamily: 'SportsBar',
                          fontSize: 20,
                        ),
                        hintText: "Buscar Cancha",
                        hintStyle: TextStyle(
                          color: cPrimaryColor.withOpacity(0.7),
                          fontFamily: 'SportsBar',
                          fontSize: 20,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        _searchLocation(value);
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final address = searchController.text;
                      _searchLocation(address);
                    },
                    child: Image.asset(
                      "assets/icons/search.png",
                      height: 60,
                      width: 60,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _searchLocation(String address) async {
    try {
      List<Location> locations = await locationFromAddress(
        address + ', Sucre, Bolivia',
        localeIdentifier: 'es_BO', // Identificador de idioma para español en Bolivia
      );
      if (locations.isNotEmpty) {
        Location firstLocation = locations.first;
        LatLng selectedLocation = LatLng(
          firstLocation.latitude,
          firstLocation.longitude,
        );
        _GoogleMapState? mapState = _GoogleMap.currentState;
        if (mapState != null) {
          mapState.moveToLocation(selectedLocation);
        }
      } else {
        print('No se encontraron resultados para la dirección ingresada en Sucre, Bolivia.');
      }
    } catch (e) {
      print('Error al buscar la ubicación: $e');
    }
  }
}

class _GoogleMap extends StatefulWidget {
  static _GoogleMapState? currentState;

  @override
  State<_GoogleMap> createState() {
    _GoogleMapState state = _GoogleMapState();
    currentState = state;
    return state;
  }
}

class _GoogleMapState extends State<_GoogleMap> {
  final Set<Marker> _markers = {};
  late GoogleMapController _mapController;

  void moveToLocation(LatLng location) {
    _mapController.animateCamera(CameraUpdate.newLatLng(location));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('selected_location'),
          position: location,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _mapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(-19.03332, -65.26274), // Coordenadas de Sucre, Bolivia
        zoom: 12,
      ),
      markers: _markers,
    );
  }
}