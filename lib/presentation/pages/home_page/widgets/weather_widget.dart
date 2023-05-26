import 'package:flutter/material.dart';

import '../../../widgets/text_container.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF1F2937),
      ),
      child: const Column(
        children: [
          //Top
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextContainer(
                        'Fri, 21 March',
                        textColor: Color(0xFF6B7280),
                        fontSize: 11,
                      ),
                      TextContainer(
                        'Cloudy',
                        fontSize: 14,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextContainer(
                    '+24°C',
                    textColor: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  TextContainer(
                    'Tashkent, Uzbekistan',
                    textColor: Color(0xFF6B7280),
                    fontSize: 11,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Color(0xFF374151), thickness: 2),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _WeaterInfoItem(title: 'Humidity', value: '65%'),
              _WeaterInfoItem(title: 'Wind speed', value: '5 km/h'),
              _WeaterInfoItem(title: 'Precipitation', value: '83%'),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeaterInfoItem extends StatelessWidget {
  const _WeaterInfoItem({
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextContainer(
              title,
              textColor: const Color(0xFF6B7280),
              fontSize: 11,
            ),
            TextContainer(
              value,
              fontSize: 12,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
