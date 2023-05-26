import 'package:flutter/material.dart';

import '../../../../constants/const_colors.dart';
import '../../../widgets/text_container.dart';

class CategoryTabWidget extends StatelessWidget {
  const CategoryTabWidget({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? ConstColors.secondary : null,
          border: Border.all(
            color: ConstColors.secondary,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextContainer(
          title,
          fontSize: 14,
          textColor: isSelected ? Colors.white : ConstColors.secondary,
        ),
      ),
    );
  }
}
