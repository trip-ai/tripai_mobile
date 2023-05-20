import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import '../../widgets/button_container.dart';
import '../../widgets/text_container.dart';
import '../location_page/location_page.dart';
import 'widgets/interest_item.dart';

class InterestPage extends StatefulWidget {
  static const String routeName = 'interests';
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  var interestsList = [
    'Swimming',
    'Eating',
    'Nature',
    'Sport',
    'Game',
    'Events',
    'Cinema',
    'National foods',
    'Ice skating',
    'Music',
    'Museums',
    'Fast food',
    'Clothes',
    'Ice cream',
    'Bowling',
    'Flowers',
    'Attractions',
    'Gardens',
    'Statues',
    'Sea',
    'Competitions',
    'Trees',
    'Animals',
    'Technology',
    'Dance',
    'Fountains',
    'Skate'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextContainer(
                      S.current.whatInterests,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.red,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.red,
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstOut,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(interestsList.length, (index) {
                        return InterestItem(title: interestsList[index]);
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ButtonContainer(
                title: S.current.startBtn,
                onTap: () {
                  context.pushReplacementNamed(LocationPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
