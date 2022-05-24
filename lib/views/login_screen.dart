import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uberapp/components/txt_form_field.dart';
import 'package:uberapp/controller/controller.dart';
import 'package:uberapp/shared/utils/app_files.dart';
import 'package:uberapp/shared/utils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ControllerStore controller = ControllerStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backgroundLogin),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                      AppImages.logoLogin,
                      width: 200,
                      height: 150,
                    ),
                  ),
                  TxtForm(
                    obscureText: false,
                    hintText: AppStrings.txtEmail,
                    onChange: (String value) {
                      controller.setEmail(value);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TxtForm(
                    obscureText: true,
                    hintText: AppStrings.txtSenha,
                    onChange: (String value) {
                      controller.setPassword(value);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      AppStrings.txtLogin,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  ),
                  Center(
                    child: GestureDetector(
                      child: const Text(
                        AppStrings.txtRegister,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/register');
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
