import 'package:flutter/material.dart';

import '../../../widgets/place_item_widget.dart';
import '../../../widgets/search_field_widget.dart';

class FavouritePlaceContainerWidget extends StatefulWidget {
  const FavouritePlaceContainerWidget({
    super.key,
  });

  @override
  State<FavouritePlaceContainerWidget> createState() =>
      _FavouritePlaceContainerWidgetState();
}

class _FavouritePlaceContainerWidgetState
    extends State<FavouritePlaceContainerWidget> {
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
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: 320,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: const PlaceItemWidget(padding: EdgeInsets.zero),
                ),
                Container(
                  height: 320,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: const PlaceItemWidget(padding: EdgeInsets.zero),
                ),
                Container(
                  height: 320,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: const PlaceItemWidget(padding: EdgeInsets.zero),
                ),
                Container(
                  height: 320,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: const PlaceItemWidget(padding: EdgeInsets.zero),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
