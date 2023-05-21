import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/const_colors.dart';
import '../../../generated/l10n.dart';
import '../../widgets/button_container.dart';
import '../../widgets/text_container.dart';
import '../loading_page/loading_page.dart';

class LocationPage extends StatefulWidget {
  static const String routeName = 'location';
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 32),
            TextContainer(
              S.current.locationPermissionText,
              textAlign: TextAlign.center,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/img/location/location.png'),
              ),
            ),
            const SizedBox(width: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ButtonContainer(
                    title: S.current.followTheLocation,
                    onTap: () {
                      context.pushReplacementNamed(LoadingPage.routeName);
                    },
                  ),
                  const SizedBox(height: 8),
                  ButtonContainer(
                    title: S.current.skipBtn,
                    textColor: ConstColors.secondary,
                    background: Theme.of(context).scaffoldBackgroundColor,
                    borderColor: ConstColors.secondary,
                    onTap: () {
                      context.pushReplacementNamed(LoadingPage.routeName);
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
