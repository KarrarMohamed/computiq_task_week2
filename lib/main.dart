import 'package:computiq_task_week2/core/api_response.dart';
import 'package:computiq_task_week2/core/colors.dart';
import 'package:computiq_task_week2/core/state_models.dart';
import 'package:computiq_task_week2/screens/home_screen.dart';
import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/error_screen.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        defaultScaleFactor: 1,
        maxWidth: 360,
        maxWidthLandscape: 640,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Consumer(
        builder: (context, watch, _) {
          final loadingState = watch(weatherForecastLoadingStateProvider);
          final stateNotifier = watch(weatherStateProvider.notifier);
          if (loadingState == WeatherForecastLoadingState.finished) {
            if (stateNotifier.weatherForecast is WeatherForecastState) {
              return const HomeScreen();
            }
            late String message;
            if (stateNotifier.weatherForecast is NoInternetConnection) {
              message = (stateNotifier.weatherForecast as NoInternetConnection).data;
            } else if (stateNotifier.weatherForecast is ServerNotResponding) {
              message = (stateNotifier.weatherForecast as ServerNotResponding).data;
            } else {
              message = (stateNotifier.weatherForecast as Failure).data;
            }

            return ErrorScreen(errorMessage: message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
