import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/const_colors.dart';
import '../../../widgets/info_container_widget.dart';
import '../../../widgets/text_container.dart';

class CustomPlaceWidget extends StatelessWidget {
  const CustomPlaceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
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
        const SizedBox(height: 8),
        const TextContainer(
          '#picnic #nature #mountains',
          fontSize: 12,
          textColor: ConstColors.gray400,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 8),
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
        const SizedBox(height: 8),
        const TextContainer(
          'Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis...',
          maxLine: 3,
          textOverflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
