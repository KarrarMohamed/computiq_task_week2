import 'package:computiq_task_week2/core/state_models.dart';
import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'forcast_holder_widget.dart';

class ForecastListWidget extends ConsumerWidget {
  const ForecastListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stateNotifier = watch(weatherStateProvider.notifier).weatherForecast as WeatherForecastState;
    final _itemCount = stateNotifier.weatherForecastPayload!.forecast.forecastday.length;
    return ListView.builder(
      itemCount: _itemCount,
      itemBuilder: (context, pos) => ForecastHolderWidget(pos: pos),
    );
  }
}
