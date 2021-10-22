import 'dart:convert';

import 'package:computiq_task_week2/core/api_response.dart';
import 'package:computiq_task_week2/core/forecast_payload.dart';
import 'package:computiq_task_week2/core/http_client.dart';
import 'package:computiq_task_week2/core/payload_model.dart';
import 'package:computiq_task_week2/core/state_models.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  late ProviderReference _ref;

  ApiClient({required ProviderReference reference}) {
    _ref = reference;
  }

  Future<ApiResponse> fetchWeather({required String city}) async {
    // var isConnected = await checkInternetConnection();
    // if (!isConnected) {
    //   return NoInternetConnection();
    // }
    var response = await _ref.read(httpProvider).fetchWeather(city: city);
    if (response is SuccessResponse) {
      WeatherPayload payload = WeatherPayload.fromJson(json.decode(response.data));
      var stateObject = WeatherState(weatherPayload: payload);
      return stateObject;
    } else {
      return response;
    }
  }

  Future<ApiResponse> fetchForecast({required String city}) async {
    // var isConnected = await checkInternetConnection();
    // if (!isConnected) {
    //   return NoInternetConnection();
    // }
    var response = await _ref.read(httpProvider).fetchForecast(city: city);
    if (response is SuccessResponse) {
      WeatherForcastPayload payload = WeatherForcastPayload.fromJson(json.decode(response.data));
      var weatherForecastState = WeatherForecastState(weatherForecastPayload: payload);
      return weatherForecastState;
    } else {
      return response;
    }
  }
}

Future checkInternetConnection() async {
  ConnectivityResult connectionResult = await Connectivity().checkConnectivity();
  return connectionResult == ConnectivityResult.mobile || connectionResult == ConnectivityResult.wifi;
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(reference: ref);
});
