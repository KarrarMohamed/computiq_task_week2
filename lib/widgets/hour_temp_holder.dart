import 'package:computiq_task_week2/core/colors.dart';
import 'package:computiq_task_week2/core/state_models.dart';
import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'temperature_holder_widget.dart';

class HourTemperatureHolder extends ConsumerWidget {
  final int pos;

  const HourTemperatureHolder({
    Key? key,
    required this.pos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final myStateNotifier = watch(weatherStateProvider);
    final weather = myStateNotifier.weatherForecast as WeatherForecastState;
    final DateTime date = DateTime.parse(weather.weatherForecastPayload!.forecast.forecastday.first.hour[pos].time);
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 5),
      child: Container(
        width: 180,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: secondaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                scale: 1.7,
                child: Image.network('https:' + weather.weatherForecastPayload!.forecast.forecastday.first.hour[pos].condition.icon),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${date.hour}:00',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  TemperatureHolderWidget(
                    temperature: weather.weatherForecastPayload!.forecast.forecastday.first.hour[pos].tempC,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
