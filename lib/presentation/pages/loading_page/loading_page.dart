import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/text_container.dart';
import '../home_page/home_page.dart';

class LoadingPage extends StatefulWidget {
  static const String routeName = 'loading';
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  var controller = PageController();
  int _currentPage = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentPage >= 2) {
        timer.cancel();
        context.pushReplacementNamed(HomePage.routeName);
      }

      if (_currentPage < 2) {
        _currentPage++;
      }

      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void deactivate() {
    timer.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextContainer(
                'Please wait,',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              const TextContainer(
                'we are preparing',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 44,
                child: PageView(
                  scrollDirection: Axis.vertical,
                  pageSnapping: true,
                  controller: controller,
                  children: const [
                    TextContainer(
                      'places',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    TextContainer(
                      'itineraries',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    TextContainer(
                      'restaurants',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const TextContainer(
                'for you!',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
