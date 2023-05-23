import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../constants/const_colors.dart';
import '../../../data/repositories/local_data_repository.dart';
import '../../../generated/l10n.dart';
import '../../widgets/button_container.dart';
import '../../widgets/text_container.dart';
import '../home_page/home_page.dart';
import '../interests_page/interests_page.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    navigateTo() {
      if (LocalDataRepository.interestsList.isEmpty) {
        context.goNamed(InterestPage.routeName);
      } else {
        context.goNamed(HomePage.routeName);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 32),
            TextContainer(
              S.current.registerText,
              textAlign: TextAlign.center,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            Image.asset('assets/img/login/login.png'),
            const SizedBox(width: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ButtonContainer(
                    title: S.current.nextBtn,
                    onTap: () async {
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      var singIn = await googleSignIn.signIn();
                      if (singIn != null) {
                        print(singIn.toString());
                      }
                      await googleSignIn.signOut();
                    },
                  ),
                  const SizedBox(height: 8),
                  ButtonContainer(
                    title: S.current.skipBtn,
                    textColor: ConstColors.secondary,
                    background: Theme.of(context).scaffoldBackgroundColor,
                    borderColor: ConstColors.secondary,
                    onTap: () {
                      navigateTo();
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
