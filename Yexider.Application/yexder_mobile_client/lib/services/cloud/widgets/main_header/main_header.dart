import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/elements/avatar/avatar.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';

class YexiderHeader extends StatelessWidget {
  final String title;

  const YexiderHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: AvatarElement(
                base64String: userState.user?.avatar ?? "", 
                size: const Size(42, 42),
                borderRadius: 42,
                onClick: () {
                  if (userState.user != null) {
                    applicationState.showProfileBottomPanel(context, userState.user as UserModel);
                  }
                },
              ),
            )
          ],
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.matrix(<double>[
                    -1, 0, 0, 0, 255,
                    0, -1, 0, 0, 255,
                    0, 0, -1, 0, 255,
                    0, 0, 0, 1, 0,
                  ]),
                  child: SvgPicture.asset(
                    "assets/icons/company-logo.svg",
                    semanticsLabel: "None",
                    width: 35.0,
                    height: 35.0,
                  ),
                ),
              ),
              const Text(
                'Yexider ',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500, 
                  fontSize: 24.0, 
                  color: Color(0xFFC4C4C4)
                ),
              ),
            ],
          )
        );
      }
    );
  }
}