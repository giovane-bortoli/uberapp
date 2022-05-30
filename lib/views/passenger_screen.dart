import 'dart:async';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uberapp/controller/controller.dart';
import 'package:uberapp/shared/utils/app_colors.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  ControllerStore controller = ControllerStore();
  Completer<GoogleMapController> mapController = Completer();

  CameraPosition initPosition = const CameraPosition(
    target: LatLng(-30.061593351850355, -51.16830749839041),
    zoom: 20,
  );

  initUserPosition() async {
    await controller.getPosition();

    setState(() {
      initPosition = CameraPosition(
        target: LatLng(
          controller.currentPosition!.latitude,
          controller.currentPosition!.longitude,
        ),
        zoom: 20,
      );

      Marker markerUser = Marker(
          markerId: const MarkerId('userMarker'),
          position: LatLng(controller.currentPosition!.latitude,
              controller.currentPosition!.longitude));

      moveCamera();
    });
  }

  moveCamera() async {
    GoogleMapController googleMapController = await mapController.future;

    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(initPosition));
  }

  @override
  void initState() {
    initUserPosition();
    super.initState();
  }

  _onMapCreated(GoogleMapController googleMapController) {
    mapController.complete(googleMapController);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: initPosition,
              onMapCreated: _onMapCreated,
              //myLocationButtonEnabled: true,
              myLocationEnabled: true,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.deepPurple),
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: Text('Resultado'),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
