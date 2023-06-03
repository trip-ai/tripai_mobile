import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/cubit/weather_cubit/weather_cubit.dart';
import '../../../../generated/l10n.dart';
import '../widgets/category_tab_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/main_itinerary_list_widget.dart';
import '../widgets/main_places_list_widget.dart';
import '../../../widgets/search_field_widget.dart';
import '../widgets/weather_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final textEditingController = TextEditingController();

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
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 48),
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
                    child: SearchFieldWidget(
                      controller: textEditingController,
                      hint: S.current.homeSearchHint,
                      onChanged: () {},
                    ),
                  ),
                  const WeatherWidget(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 8),
            MainPlacesListWidget(
              title: 'Top places',
              subTitle: 'Places we recommend',
              isTop: true,
              onShowAll: () {},
            ),
            const SizedBox(height: 8),
            MainPlacesListWidget(
              title: 'Recommended places',
              subTitle: 'Recommended places based on big data',
              onShowAll: () {},
            ),
            const SizedBox(height: 8),
            MainItineraryListWidget(
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
