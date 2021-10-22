import 'package:computiq_task_week2/widgets/current_weather_holder.dart';
import 'package:computiq_task_week2/widgets/forecast_list_widget.dart';
import 'package:computiq_task_week2/widgets/header.dart';
import 'package:computiq_task_week2/widgets/hours_temp_list_widget.dart';
import 'package:computiq_task_week2/widgets/region_selector.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(),
            SizedBox(height: 10),
            Align(
              child: RegionSelector(),
              alignment: Alignment.centerRight,
            ),
            SizedBox(height: 10),
            CurrentWeatherHolderWidget(),
            SizedBox(
              height: 100,
              child: HoursListWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                'Next Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ForecastListWidget(),
            )
          ],
        ),
      ),
    );
  }
}
