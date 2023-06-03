import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/const_colors.dart';
import '../../../widgets/text_container.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
