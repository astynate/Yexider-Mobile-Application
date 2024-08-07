import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/database/database.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/account/elements/button/main_account_button.dart';
import 'package:yexder_mobile_client/services/account/elements/existing_account/existing_account.dart';
import 'package:yexder_mobile_client/services/account/features/color_mode/color_mode.dart';
import 'package:yexder_mobile_client/services/account/pages/create/create_email.dart';
import 'package:yexder_mobile_client/services/account/pages/login/login.dart';
import 'package:yexder_mobile_client/services/account/widgets/footer/account_footer.dart';
import 'package:yexder_mobile_client/services/account/widgets/header/account_header.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  UserModel? account;

  Future<UserModel?> findFirstAccount() async {
    final database = await DatabaseService.instance.databaseInstance;
    final users = await database!.query(UserModel.empthy().tableName);
    
    debugPrint(users.length.toString());

    if (users.isNotEmpty) {
      return UserModel.fromMap(users.first);
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    _initializeAccount();
    applicationState.setOrientationUp();
  }

  Future<void> _initializeAccount() async {
    UserModel? account = await findFirstAccount();

    if (account != null && mounted) {
      setState(() {
        this.account = account;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, right: 25),
              child: ColorMode(context: context),
            )
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              AccountHeader(
                title: "Hi, Yexider!", 
                widgets: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "The best place for storing and sharing data. Chat, create, enjoy!",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  if (account != null) 
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: ExistingAccount(user: account ?? UserModel.empthy()),
                    ),
                ],
              ),
              const Spacer(),
              AccountFooter(children: [
                MainAccountButton.specificObject(
                  context: context,
                  type: AccountButtonTypes.primary,
                  text: "Login", 
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  }
                ),
                MainAccountButton.specificObject(
                  context: context,
                  type: AccountButtonTypes.secondary,
                  text: "Sign up", 
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateEmailPage(),
                      ),
                    );
                  }
                )
              ])
            ],
          ),
        ]
      ),
    );
  }
}