import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uberapp/controller/controller.dart';

import '../components/txt_form_field.dart';
import '../shared/utils/app_strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ControllerStore controller = ControllerStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: const Text(AppStrings.txtAppBar),
      ),
      body: Observer(builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TxtForm(
                    obscureText: false,
                    hintText: AppStrings.txtRegisterName,
                    onChange: (String value) {
                      controller.setName(value);
                    },
                  ),
                  TxtForm(
                    obscureText: false,
                    hintText: AppStrings.txtRegisterEmail,
                    onChange: (String value) {
                      controller.setEmail(value);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TxtForm(
                    obscureText: true,
                    hintText: AppStrings.txtRegisterSenha,
                    onChange: (String value) {
                      controller.setPassword(value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        const Text(AppStrings.txtSwitchPassenger),
                        Switch(
                            value: controller.userPassenger,
                            onChanged: (bool value) {
                              controller.userPassenger = value;
                            }),
                        const Text(AppStrings.txtSwitchDriver),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      controller.createUser(
                          email: controller.email,
                          password: controller.password);

                      switch (controller.userType) {
                        case AppStrings.txtSwitchDriver:
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/driver',
                            (route) => false,
                          );

                          break;
                        case AppStrings.txtSwitchPassenger:
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/passenger',
                            (route) => false,
                          );
                      }
                    },
                    child: const Text(
                      AppStrings.txtRegisterButton,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
