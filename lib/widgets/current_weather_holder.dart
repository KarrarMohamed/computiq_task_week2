import 'package:computiq_task_week2/core/colors.dart';
import 'package:computiq_task_week2/core/state_models.dart';
import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'temperature_holder_widget.dart';

class CurrentWeatherHolderWidget extends ConsumerWidget {
  const CurrentWeatherHolderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stateNotifier = watch(weatherStateProvider);
    final weatherForecast = stateNotifier.weatherForecast as WeatherForecastState;
    final currentForecast = weatherForecast.weatherForecastPayload!.current;
    final date = DateTime.parse(currentForecast.lastUpdated);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('EEEEE', 'en_US').format(date).split(',').first,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat.yMMMMEEEEd().format(date).split(',')[1].split(' ').join(',').replaceFirst(',', ''),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
                TemperatureHolderWidget(temperature: currentForecast.tempC),
                Transform.scale(
                  scale: 1.2,
                  child: Image.network('https:' + currentForecast.condition.icon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
