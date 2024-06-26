import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/main_header/main_header.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: applicationState.isHeaderOpen ? AppBar().preferredSize :  const Size(0, 0),
            child: const YexiderHeader(title: "Home")
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: List.generate(30, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      color: Colors.grey[300],
                      height: 100,
                      child: Center(
                        child: Text('Item ${index + 1}'),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      }
    );
  }
}