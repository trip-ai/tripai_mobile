import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripai/constants/const_colors.dart';

import '../../../../domain/cubit/weather_cubit/weather_cubit.dart';
import '../../../widgets/text_container.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SizedBox(
            height: 140,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ConstColors.gray800,
          ),
          child: Column(
            children: [
              //Top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: Image.network(
                          state.weather.current.condition.icon,
                          fit: BoxFit.none,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextContainer(
                            state.weather.location.getLocaltime,
                            textColor: ConstColors.gray500,
                            fontSize: 11,
                          ),
                          TextContainer(
                            state.weather.current.condition.text,
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
                        '${state.weather.current.tempC > 0 ? '+' : ''}${state.weather.current.tempC.round()}°C',
                        textColor: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      TextContainer(
                        '${state.weather.location.name}, ${state.weather.location.country}',
                        textColor: ConstColors.gray500,
                        fontSize: 11,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: ConstColors.gray700, thickness: 2),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _WeaterInfoItem(
                    title: 'Humidity',
                    value: '${state.weather.current.humidity}%',
                    iconPath: 'assets/img/home/weather/humidity.svg',
                  ),
                  _WeaterInfoItem(
                    title: 'Wind speed',
                    value: '${state.weather.current.windKph} km/h',
                    iconPath: 'assets/img/home/weather/wind_speed.svg',
                  ),
                  _WeaterInfoItem(
                    title: 'Precipitation',
                    value: '${state.weather.current.precipIn}%',
                    iconPath: 'assets/img/home/weather/precipitation.svg',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WeaterInfoItem extends StatelessWidget {
  const _WeaterInfoItem({
    required this.title,
    required this.value,
    required this.iconPath,
  });
  final String iconPath;
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
          child: Center(
            child: SvgPicture.asset(iconPath, width: 12, height: 12),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextContainer(
              title,
              textColor: ConstColors.gray500,
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
