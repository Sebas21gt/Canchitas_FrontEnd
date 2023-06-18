import 'package:canchitas/constants.dart';
import 'package:canchitas/screens/sports/widgets/fusal_header.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          FutsalHeader(size: MediaQuery.of(context).size),
          Expanded(
            child: _GoogleMap(),
          ),
        ],
      ),
    );
  }
}

class _GoogleMap extends StatefulWidget {
  const _GoogleMap({Key? key}) : super(key: key);

  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<_GoogleMap> {
  late GoogleMapController mapController;
  TextEditingController searchController = TextEditingController();
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(-16.2902, -63.5887), // Coordenadas del centro de Bolivia
        zoom: 6, // Ajusta el nivel de zoom según tus necesidades
      ),
      markers: Set<Marker>.from(markers),
    );
  }

  Future<void> _searchPlaces(String searchText) async {
    final response = await GeocodingPlatform.instance
        .locationFromAddress(searchText + ', Bolivia');
    if (response.isNotEmpty) {
      final location = response.first;
      final latLng = LatLng(location.latitude!, location.longitude!);

      mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));

      final placemarks = await GeocodingPlatform.instance
          .placemarkFromCoordinates(location.latitude!, location.longitude!);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;

        setState(() {
          markers = [
            Marker(
              markerId: MarkerId('searchResult'),
              position: latLng,
              infoWindow: InfoWindow(
                  title: placemark.name ?? '',
                  snippet: placemark.locality ?? ''),
            ),
          ];
        });
      }
    }
  }

  void _onSearchButtonPressed() {
    final searchText = searchController.text;
    if (searchText.isNotEmpty) {
      // Activa el campo de entrada de texto antes de realizar la búsqueda
      FocusScope.of(context).requestFocus(FocusNode());
      _searchPlaces(searchText);
    }
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
