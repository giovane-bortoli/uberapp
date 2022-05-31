import 'dart:async';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uberapp/controller/controller.dart';
import 'package:uberapp/shared/utils/app_colors.dart';
import 'package:uberapp/shared/utils/app_strings.dart';

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
          title: const Text(AppStrings.txtPassengerAppBar),
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
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        icon: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          width: 10,
                          height: 20,
                          child: const Icon(
                            Icons.location_on,
                            color: AppColors.deepPurple,
                          ),
                        ),
                        hintText: AppStrings.txtLocation,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(left: 15, top: 5)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 55,
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
                  child: TextField(
                    onChanged: (String value) {
                      controller.setTypeAddress(value);
                    },
                    decoration: InputDecoration(
                        icon: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          width: 10,
                          height: 20,
                          child: const Icon(
                            Icons.local_taxi,
                            color: AppColors.deepPurple,
                          ),
                        ),
                        hintText: AppStrings.txtDestination,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(left: 15, top: 5)),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      //chamar uber
                    },
                    child: const Text(
                      AppStrings.txtCallButton,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
