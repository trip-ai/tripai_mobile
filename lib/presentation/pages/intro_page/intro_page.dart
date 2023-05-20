import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripai/presentation/pages/login_page/login_page.dart';
import 'package:tripai/presentation/widgets/text_container.dart';

import '../../widgets/button_container.dart';

class IntroPage extends StatelessWidget {
  static const String routeName = 'intro';

  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalDataRepository.isShowedIntro = true;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 32),
            const TextContainer(
              'Get ready\nfor new journeys\nwith us!',
              textAlign: TextAlign.center,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            Image.asset('assets/img/intro/intro.png'),
            const SizedBox(width: 32),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ButtonContainer(
                    title: 'Next',
                    onTap: () {
                      context.goNamed(LoginPage.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
