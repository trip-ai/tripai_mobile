import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripai/constants/const_widgets.dart';
import 'package:tripai/generated/l10n.dart';

import '../../widgets/text_container.dart';
import 'widgets/category_tab_widget.dart';
import 'widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF3F4F6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 22,
                  child: SvgPicture.asset(
                    'assets/img/home/location.svg',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextContainer('Tashkent'),
                TextContainer(
                  'Uzbekistan',
                  fontSize: 14,
                  textColor: Colors.grey.shade400,
                ),
              ],
            ),
            const Spacer(),
            Stack(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F4F6),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 18,
                      height: 22,
                      child: SvgPicture.asset(
                        'assets/img/home/bell.svg',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //Header
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(28),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryTabWidget(title: 'All', isSelected: true),
                      SizedBox(width: 10),
                      CategoryTabWidget(title: 'Fast food', isSelected: false),
                      SizedBox(width: 10),
                      CategoryTabWidget(title: 'Nature', isSelected: false),
                      SizedBox(width: 10),
                      CategoryTabWidget(title: 'Cinema', isSelected: false),
                      SizedBox(width: 10),
                      CategoryTabWidget(title: 'Picnic', isSelected: false),
                      SizedBox(width: 10),
                      CategoryTabWidget(title: 'Picnic', isSelected: false),
                      SizedBox(width: 10),
                      CategoryTabWidget(title: 'Picnic', isSelected: false),
                      SizedBox(width: 10),
                      CategoryTabWidget(title: 'Picnic', isSelected: false),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: ConstWidgets.borderRadius,
                    color: const Color(0xFFF3F4F6),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(width: 12),
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: S.current.homeSearchHint,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const WeatherWidget(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
