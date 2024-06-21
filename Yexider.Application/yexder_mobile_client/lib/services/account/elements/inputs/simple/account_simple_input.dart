import 'package:flutter/material.dart';

class AccountSimpleInput extends StatelessWidget {
  final String placeholder;
  final Function(String) onChanged;
  final String? defaultValue;

  const AccountSimpleInput({super.key, required this.placeholder, required this.onChanged, this.defaultValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: TextEditingController(text: defaultValue),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(120, 255, 255, 255)),
          hintText: placeholder,
          labelText: placeholder,
          hintStyle: const TextStyle(color: Color.fromARGB(120, 255, 255, 255)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}