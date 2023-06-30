import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripai/constants/const_colors.dart';

import '../../widgets/custom_network_image.dart';
import '../../widgets/expandable_widget.dart';
import '../../widgets/info_container_widget.dart';
import '../../widgets/text_container.dart';
import 'widgets/custom_place_widget.dart';
import 'widgets/place_header_widget.dart';

class PlacePage extends StatefulWidget {
  static const String routeName = 'place';

  const PlacePage({super.key});

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const PlaceHeaderWidget(),
          ];
        },
        body: Builder(builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF00AA6C).withOpacity(0.25),
                          Colors.white,
                          Colors.white,
                        ],
                        stops: const [-0.5, 0.7, 0.9],
                      ),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextContainer(
                            'From Tashkent Ecopark to the National Stadium',
                            maxLine: 2,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              InfoContainerWidget(
                                title: '3 places',
                                icon: Icon(Icons.compare_arrows_rounded,
                                    size: 10),
                              ),
                              SizedBox(width: 5),
                              InfoContainerWidget(
                                title: '288 likes',
                                icon: Icon(Icons.star, size: 10),
                              ),
                              SizedBox(width: 5),
                              InfoContainerWidget(
                                background: Colors.green,
                                textColor: Colors.white,
                                title: '3 places',
                                icon: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 64,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF3C7),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: SvgPicture.asset(
                                    'assets/img/place/warning.svg',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Flexible(
                                  child: TextContainer(
                                    'This itinerary is private and cannot be seen by users other than you.',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextContainer(
                          'Itinerary map',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const SizedBox(
                            height: 220,
                            child: CustomNetworkImage(
                              imageUrl:
                                  'https://podrobno.uz/upload/iblock/b14/18767707dfb922126a5b87f4f0eda083.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextContainer(
                          'Itinerary places',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 10),
                        ExpandableWidget(
                          count: 1,
                          title: 'Tashkent Ecopark',
                          child: CustomPlaceWidget(),
                        ),
                        SizedBox(height: 10),
                        ExpandableWidget(
                          count: 2,
                          title: 'Rayhon national foods',
                          child: CustomPlaceWidget(),
                        ),
                        SizedBox(height: 10),
                        ExpandableWidget(
                          count: 3,
                          title: 'National stadium',
                          child: CustomPlaceWidget(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextContainer(
                          'Other similar itineraries',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const TextContainer(
                          'Similar itineraries in this direction',
                          fontSize: 12,
                          textColor: ConstColors.gray400,
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const SizedBox(
                            height: 220,
                            child: CustomNetworkImage(
                              imageUrl:
                                  'https://podrobno.uz/upload/iblock/b14/18767707dfb922126a5b87f4f0eda083.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          );
        }),
      ),
    );
  }
}
