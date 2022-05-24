import 'package:flutter/material.dart';
import 'package:uberapp/shared/theme/theme_data.dart';
import 'package:uberapp/views/driver_screen.dart';
import 'package:uberapp/views/home_page.dart';
import 'package:uberapp/views/login_screen.dart';
import 'package:uberapp/views/passenger_screen.dart';
import 'package:uberapp/views/register_screen.dart';

class UberApp extends StatelessWidget {
  const UberApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.materialTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/passenger': (context) => const PassengerScreen(),
        '/driver': (context) => const DriverScreen()
      },
    );
  }
}
