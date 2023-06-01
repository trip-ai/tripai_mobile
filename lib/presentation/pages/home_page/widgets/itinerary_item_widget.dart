import 'package:flutter/material.dart';

import '../../../../constants/const_colors.dart';
import '../../../../constants/const_widgets.dart';
import '../../../widgets/itinerary_item_widget.dart';
import '../../../widgets/text_container.dart';

class ItineraryListWidget extends StatelessWidget {
  const ItineraryListWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onShowAll,
    this.isTop = false,
  });

  final String title;
  final String subTitle;
  final bool isTop;
  final VoidCallback onShowAll;

  @override
  Widget build(BuildContext context) {
    var controller = PageController(
      viewportFraction: 342 / MediaQuery.of(context).size.width,
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: ConstWidgets.borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainer(
                      title,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    TextContainer(
                      subTitle,
                      fontSize: 12,
                      textColor: ConstColors.gray400,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                InkWell(
                  onTap: onShowAll,
                  child: const Row(
                    children: [
                      TextContainer(
                        'Show all',
                        textColor: ConstColors.gray600,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ConstColors.gray600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 380,
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              controller: controller,
              padEnds: false,
              children: List.generate(10, (index) {
                EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 11);
                if (index == 0) {
                  padding = const EdgeInsets.only(left: 16, right: 6);
                } else if (index == 9) {
                  padding = const EdgeInsets.only(left: 6, right: 16);
                }

                return ItineraryItemWidget(padding: padding, isTop: isTop);
              }),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
