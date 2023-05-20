import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripai/constants/const_colors.dart';
import 'package:tripai/data/repositories/local_data_repository.dart';
import 'package:tripai/presentation/pages/home_page/home_page.dart';
import 'package:tripai/presentation/pages/interests_page/interests_page.dart';
import 'package:tripai/presentation/widgets/text_container.dart';

import '../../widgets/button_container.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalDataRepository.isShowedIntro = true;
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
            const TextContainer(
              'Register in the app\nto save your data!',
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
                    title: 'Next',
                    onTap: () {
                      navigateTo();
                    },
                  ),
                  const SizedBox(height: 8),
                  ButtonContainer(
                    title: 'Skip',
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
