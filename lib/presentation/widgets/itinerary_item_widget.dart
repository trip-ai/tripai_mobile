import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/const_colors.dart';
import 'info_container_widget.dart';
import 'text_container.dart';

class ItineraryItemWidget extends StatelessWidget {
  const ItineraryItemWidget({
    super.key,
    required this.padding,
    this.isTop = false,
  });

  final EdgeInsets padding;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ConstColors.primary.withOpacity(0.2),
              ConstColors.primary.withOpacity(0.05),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Flexible(
                  child: TextContainer(
                    'From Rayhon milliy taomlar to National football stadium',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: ConstColors.gray100,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 15,
                      height: 15,
                      child: SvgPicture.asset(
                        'assets/img/home/place/not_favourite.svg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const InfoContainerWidget(
                  icon: Icon(
                    Icons.compare_arrows,
                    size: 10,
                  ),
                  title: '3 places',
                ),
                const SizedBox(width: 4),
                InfoContainerWidget(
                  icon: SizedBox(
                    width: 15,
                    height: 15,
                    child: SvgPicture.asset(
                      'assets/img/home/place/not_favourite.svg',
                    ),
                  ),
                  title: '245',
                ),
                const SizedBox(width: 4),
                const InfoContainerWidget(
                  icon: Icon(
                    Icons.star,
                    size: 10,
                    color: Colors.white,
                  ),
                  title: 'AI generated',
                  background: ConstColors.primary,
                  textColor: Colors.white,
                ),
              ],
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 128,
                  width: double.infinity,
                  child: _ImageWithRating(),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 128,
                  child: Row(
                    children: [
                      Flexible(child: _ImageWithRating()),
                      SizedBox(width: 8),
                      Flexible(child: _ImageWithRating()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageWithRating extends StatelessWidget {
  const _ImageWithRating();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/img/home/image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const InfoContainerWidget(
              title: '4.8',
              icon: Icon(
                Icons.star,
                size: 10,
              ),
              background: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
