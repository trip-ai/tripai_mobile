import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tripai/generated/l10n.dart';

import '../../../constants/const_colors.dart';
import '../../../data/repositories/local_data_repository.dart';
import '../../../data/resources/local/local_storage.dart';
import '../../widgets/text_container.dart';
import '../home_page/home_page.dart';
import '../intro_page/intro_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isCompleted = false;

  init() async {
    await S.load(const Locale('en'));
    await LocalStorage.init();
    bool isShowedIntor = LocalDataRepository.isShowedIntro;
    navigateToIntro();
    // if (isShowedIntor) {
    //   navigateToHome();
    // } else {
    //   navigateToIntro();
    // }
  }

  navigateToHome() {
    context.goNamed(HomePage.routeName);
  }

  navigateToIntro() {
    context.goNamed(IntroPage.routeName);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
            child: SvgPicture.asset('assets/img/logo.svg'),
          ),
          const SizedBox(height: 13),
          const TextContainer(
            'Your AI-enhanced\ntrip advisor',
            textAlign: TextAlign.center,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}
