import 'package:computiq_task_week2/core/state_models.dart';
import 'package:computiq_task_week2/state/my_state.dart';
import 'package:computiq_task_week2/widgets/hour_temp_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoursListWidget extends ConsumerWidget {
  const HoursListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stateNotifier = watch(weatherStateProvider.notifier);
    final weather = (stateNotifier.weatherForecast as WeatherForecastState).weatherForecastPayload!;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weather.forecast.forecastday[1].hour.length,
      itemBuilder: (context, pos) => HourTemperatureHolder(pos: pos),
    );
  }
}
