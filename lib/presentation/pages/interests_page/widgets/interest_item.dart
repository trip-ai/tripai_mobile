import 'package:flutter/material.dart';

import '../../../../constants/const_colors.dart';
import '../../../widgets/text_container.dart';

class InterestItem extends StatefulWidget {
  const InterestItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<InterestItem> createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? ConstColors.primary : null,
          border: Border.all(
            color: isSelected ? ConstColors.primary : Colors.black,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextContainer(widget.title),
      ),
    );
  }
}
