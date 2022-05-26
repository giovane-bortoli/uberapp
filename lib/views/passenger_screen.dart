import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uberapp/controller/controller.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

Completer<GoogleMapController> mapController = Completer();
CameraPosition cameraPosition =
    CameraPosition(target: LatLng(-29.915232694095245, -51.188803497385315));

class _PassengerScreenState extends State<PassengerScreen> {
  ControllerStore controller = ControllerStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Screen'),
        actions: [
          PopupMenuButton<String>(
              onSelected: controller.menuItem,
              itemBuilder: (context) {
                return controller.itensMenu.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              }),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition,
        onMapCreated: controller.onMapCreated,
      ),
    );
  }
}
