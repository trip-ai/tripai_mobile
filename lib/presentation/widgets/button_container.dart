import 'package:flutter/material.dart';
import 'package:tripai/constants/const_colors.dart';
import 'package:tripai/constants/const_widgets.dart';

import 'text_container.dart';

enum IconPosition { left, top, right, bottom }

class ButtonContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? icon;
  final IconPosition iconPosition;
  final String title;
  final double? width;
  final Color? background;
  final Color? borderColor;
  final Color? textColor;
  final double fontSize;

  const ButtonContainer({
    Key? key,
    required this.title,
    this.onTap,
    this.width,
    this.background,
    this.borderColor,
    this.textColor,
    this.fontSize = 16,
    this.icon,
    this.iconPosition = IconPosition.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: ConstWidgets.borderRadius,
            side: BorderSide(
              color: (borderColor ?? background) ?? Colors.transparent,
            ),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(
          ConstColors.primary.withOpacity(0.3),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return background ?? ConstColors.secondary;
            } else if (states.contains(MaterialState.disabled)) {
              return ConstColors.primary.withOpacity(0.3);
            }
            return background ?? ConstColors.secondary;
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && iconPosition == IconPosition.left)
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: icon!,
              ),
            Container(
              height: 56,
              width: width,
              alignment: Alignment.center,
              child: TextContainer(
                title,
                textAlign: TextAlign.center,
                textColor: textColor ?? Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (icon != null && iconPosition == IconPosition.right)
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: icon!,
              ),
          ],
        ),
      ),
    );
  }
}
