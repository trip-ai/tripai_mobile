import 'package:flutter/material.dart';
import 'package:tripai/constants/const_colors.dart';
import 'package:tripai/presentation/pages/home_page/widgets/favourite_itinerary_container_widget.dart';
import 'package:tripai/presentation/widgets/text_container.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/favourite_place_container_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: CustomAppBar(),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -7,
                      left: 0,
                      right: 0,
                      child: Divider(
                        thickness: 2,
                        color: ConstColors.gray300,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TabBar(
                            isScrollable: true,
                            indicatorColor: ConstColors.gray500,
                            tabs: [
                              Tab(
                                child: TextContainer('Itineraries'),
                              ),
                              Tab(
                                child: TextContainer('Places'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FavouriteItineraryContainerWidget(),
                    FavouritePlaceContainerWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
