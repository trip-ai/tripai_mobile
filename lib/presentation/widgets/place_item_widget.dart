import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/const_colors.dart';
import 'info_container_widget.dart';
import 'text_container.dart';

class PlaceItemWidget extends StatelessWidget {
  const PlaceItemWidget({
    super.key,
    required this.padding,
    this.isTop = false,
  });

  final EdgeInsets padding;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 240,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/img/home/image.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                if (isTop)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: ConstColors.gray100,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/img/home/place/top.svg',
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
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
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextContainer(
                'Tashkent Ecopark',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              TextContainer(
                '#picnic #nature #mountains',
                fontSize: 12,
                textColor: ConstColors.gray400,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const Row(
            children: [
              InfoContainerWidget(
                icon: Icon(
                  Icons.star,
                  size: 10,
                ),
                title: '4.5',
              ),
              SizedBox(width: 4),
              InfoContainerWidget(
                icon: Icon(
                  Icons.chat,
                  size: 10,
                ),
                title: '245',
              ),
              SizedBox(width: 4),
              InfoContainerWidget(
                icon: Icon(
                  Icons.location_on,
                  size: 10,
                ),
                title: 'Tashkent',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
