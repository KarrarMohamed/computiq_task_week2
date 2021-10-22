import 'package:computiq_task_week2/state/my_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({Key? key,required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Oops!',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20),
          TextButton(
            child: Text(
              'Reload',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              context.read(weatherStateProvider.notifier).fetchWeatherForecast();
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.amber)),
          )
        ],
      ),
    );
  }
}
