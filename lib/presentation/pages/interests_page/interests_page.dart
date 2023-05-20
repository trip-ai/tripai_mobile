import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripai/constants/const_colors.dart';
import 'package:tripai/presentation/pages/location_page/location_page.dart';
import 'package:tripai/presentation/widgets/button_container.dart';
import 'package:tripai/presentation/widgets/text_container.dart';

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
              const SizedBox(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextContainer(
                      'What interests you?',
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
                title: 'Getting started',
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

class InterestItem extends StatefulWidget {
  const InterestItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<InterestItem> createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? ConstColors.primary : null,
          border: isSelected ? null : Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextContainer(widget.title),
      ),
    );
  }
}
