import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/const_colors.dart';
import '../../../../constants/const_widgets.dart';
import '../../../../domain/cubit/weather_cubit/weather_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../widgets/text_container.dart';
import '../widgets/category_tab_widget.dart';
import '../widgets/itinerary_item_widget.dart';
import '../widgets/places_item_widget.dart';
import '../widgets/weather_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    if (!BlocProvider.of<WeatherCubit>(context).state.isLoaded) {
      BlocProvider.of<WeatherCubit>(context).getWeather(
        lat: 41.3109753,
        long: 69.2793835,
      );
    }
  }

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
                color: ConstColors.gray100,
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextContainer('Tashkent'),
                TextContainer(
                  'Uzbekistan',
                  fontSize: 14,
                  textColor: ConstColors.gray400,
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
                    color: ConstColors.gray100,
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
      body: SingleChildScrollView(
        child: Column(
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
                        CategoryTabWidget(
                            title: 'Fast food', isSelected: false),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: ConstWidgets.borderRadius,
                      color: ConstColors.gray100,
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
            const SizedBox(height: 8),
            PlacesListWidget(
              title: 'Top places',
              subTitle: 'Places we recommend',
              isTop: true,
              onShowAll: () {},
            ),
            const SizedBox(height: 8),
            PlacesListWidget(
              title: 'Recommended places',
              subTitle: 'Recommended places based on big data',
              onShowAll: () {},
            ),
            const SizedBox(height: 8),
            ItineraryListWidget(
              title: 'Recommended itineraries',
              subTitle: 'AI generated itineraries from popular places',
              onShowAll: () {},
            ),
          ],
        ),
      ),
    );
  }
}
