import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/theme_state.dart';
import 'package:yexder_mobile_client/services/proxy/pages/authorization/authorization.dart';

void main() {
  runApp(const YexiderApplication());
}

class YexiderApplication extends StatelessWidget {
  const YexiderApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: colorTheme.currentTheme,
        home: const AuthorizationPage(),
      ),
    );
  }
}