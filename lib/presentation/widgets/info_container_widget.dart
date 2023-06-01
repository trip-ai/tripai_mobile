import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import 'text_container.dart';

class InfoContainerWidget extends StatelessWidget {
  const InfoContainerWidget({
    super.key,
    required this.title,
    required this.icon,
    this.background,
    this.textColor,
  });

  final String title;
  final Widget icon;
  final Color? background;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          color: background ?? ConstColors.gray900,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
            height: 10,
            child: Center(child: icon),
          ),
          const SizedBox(width: 2),
          TextContainer(
            title,
            textColor: textColor,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
