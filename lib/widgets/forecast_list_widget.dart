import 'package:computiq_task_week2/core/state_models.dart';
import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'forcast_holder_widget.dart';

class ForecastListWidget extends ConsumerWidget {
  const ForecastListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stateNotifier = watch(weatherStateProvider.notifier);
    return ListView.builder(
      itemCount: (stateNotifier.weatherForecast as WeatherForecastState).weatherForecastPayload!.forecast.forecastday.length,
      itemBuilder: (context, pos){
        debugPrint((stateNotifier.weatherForecast as WeatherForecastState).weatherForecastPayload!.forecast.forecastday[pos].date);
        var date = DateTime.fromMillisecondsSinceEpoch((stateNotifier.weatherForecast as WeatherForecastState).weatherForecastPayload!.forecast.forecastday[pos].dateEpoch).toIso8601String();
        debugPrint(date);
        return ForecastHolderWidget(pos: pos);
      },
    );
  }
}
