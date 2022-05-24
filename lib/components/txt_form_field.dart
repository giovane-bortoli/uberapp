import 'package:flutter/material.dart';

class TxtForm extends StatelessWidget {
  final String hintText;
  final Function(String) onChange;
  final bool obscureText;

  const TxtForm(
      {Key? key,
      required this.hintText,
      required this.onChange,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onChanged: onChange,
    );
  }
}
