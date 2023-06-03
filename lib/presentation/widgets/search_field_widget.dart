import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import '../../constants/const_widgets.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.onChanged,
    required this.hint,
    required this.controller,
  });

  final TextEditingController controller;
  final VoidCallback onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: ConstWidgets.borderRadius,
        color: ConstColors.gray100,
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 12),
          Flexible(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
