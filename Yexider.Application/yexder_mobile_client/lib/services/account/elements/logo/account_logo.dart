import 'package:flutter/material.dart';

class AccountLogo extends StatelessWidget {
  const AccountLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/company-logo.png",
      width: 72.0,
      height: 72.0,
    );
  }
}