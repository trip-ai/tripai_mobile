import 'package:flutter/material.dart';

import '../../../widgets/itinerary_item_widget.dart';
import '../../../widgets/search_field_widget.dart';

class FavouriteItineraryContainerWidget extends StatefulWidget {
  const FavouriteItineraryContainerWidget({
    super.key,
  });

  @override
  State<FavouriteItineraryContainerWidget> createState() =>
      _FavouriteItineraryContainerWidgetState();
}

class _FavouriteItineraryContainerWidgetState
    extends State<FavouriteItineraryContainerWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 12, bottom: 56),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchFieldWidget(
              onChanged: () {},
              hint: 'Search',
              controller: controller,
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: 392,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: const ItineraryItemWidget(padding: EdgeInsets.zero),
                ),
                Container(
                  height: 392,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: const ItineraryItemWidget(padding: EdgeInsets.zero),
                ),
                Container(
                  height: 392,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: const ItineraryItemWidget(padding: EdgeInsets.zero),
                ),
                Container(
                  height: 392,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: const ItineraryItemWidget(padding: EdgeInsets.zero),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
