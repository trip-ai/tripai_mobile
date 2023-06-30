import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import 'text_container.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({
    super.key,
    required this.count,
    required this.title,
    required this.child,
  });

  final int count;
  final String title;
  final Widget child;

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final Animation<double> rotationAnimation;
  var controller = ExpandableController();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    rotationAnimation =
        Tween<double>(begin: 0, end: 0.5).animate(animationController);

    controller.addListener(() {
      if (controller.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: controller,
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapBodyToExpand: true,
        tapBodyToCollapse: true,
        hasIcon: false,
      ),
      header: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ConstColors.gray100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: ConstColors.gray900,
                shape: BoxShape.circle,
              ),
              child: TextContainer(
                widget.count.toString(),
                textColor: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            TextContainer(
              widget.title,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            RotationTransition(
              turns: rotationAnimation,
              child: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ],
        ),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Column(
        children: [
          const SizedBox(height: 10),
          widget.child,
        ],
      ),
    );
  }
}
