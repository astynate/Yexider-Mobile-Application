import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/pages/cloud/layout/cloud_page_layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/explore/layout/explore_page_layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/gallery/layout/gallery_page_layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/home/layout/home_page_layout.dart';
import 'package:yexder_mobile_client/services/cloud/pages/music/layout/music_page_layout.dart';
import 'package:yexder_mobile_client/services/cloud/widgets/navigation_panel/navigation_panel.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  final List<Widget> _pages = [
    const HomePageLayout(),
    const ExplorePageLayout(),
    const CloudPageLayout(),
    const GalleryPageLayout(),
    const MusicPageLayout()
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          body: _pages[applicationState.currentIndex],
          bottomNavigationBar: YexiderNavigationPanel(isOpen: applicationState.isBottomPanelOpen)
        );
      }
    );
  }
}