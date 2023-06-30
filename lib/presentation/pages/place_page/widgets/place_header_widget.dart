import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/const_colors.dart';
import '../../../widgets/custom_network_image.dart';

class PlaceHeaderWidget extends StatefulWidget {
  const PlaceHeaderWidget({
    super.key,
  });

  @override
  State<PlaceHeaderWidget> createState() => _PlaceHeaderWidgetState();
}

class _PlaceHeaderWidgetState extends State<PlaceHeaderWidget> {
  var imagesPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        expandedHeight: 220,
        elevation: 0,
        pinned: true,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: ConstColors.gray900,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.share,
                  color: ConstColors.gray900,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.star,
                  color: ConstColors.gray900,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Positioned.fill(
                child: PageView(
                  controller: imagesPageController,
                  children: List.generate(5, (index) {
                    return const CustomNetworkImage(
                      imageUrl:
                          'https://www.people-travels.com/images/uzbekistan-nature-reserves/uzbekistan-nature-reserves.jpg',
                    );
                  }),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: imagesPageController,
                    count: 5,
                    axisDirection: Axis.horizontal,
                    effect: WormEffect(
                      spacing: 8.0,
                      radius: 5,
                      dotWidth: 10,
                      dotHeight: 10,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Colors.white.withOpacity(0.6),
                      activeDotColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
