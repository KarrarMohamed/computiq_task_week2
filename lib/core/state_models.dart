import 'package:computiq_task_week2/core/api_response.dart';
import 'package:computiq_task_week2/core/forecast_payload.dart';
import 'package:computiq_task_week2/core/payload_model.dart';

class WeatherState implements ApiResponse {
  WeatherPayload? weatherPayload;
  String? errorMessage;
  bool hasError;

  WeatherState({
    this.weatherPayload,
    this.errorMessage,
    this.hasError = false,
  });
}

class WeatherForecastState implements ApiResponse{
  WeatherForcastPayload? weatherForecastPayload;
  String? errorMessage;
  bool hasError;

  WeatherForecastState({
    this.weatherForecastPayload,
    this.errorMessage,
    this.hasError = false,
  });
}
