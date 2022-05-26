import 'package:flutter/material.dart';
import 'package:uberapp/controller/controller.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

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
      body: Container(),
    );
  }
}
