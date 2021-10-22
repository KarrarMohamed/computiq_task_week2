import 'dart:async';

import 'package:computiq_task_week2/core/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static const String _apiKey = 'a0717c43e6434b08a41155908211910';

  Future<ApiResponse> fetchWeather({required String city}) async {
    final String url = 'http://api.weatherapi.com/v1/current.json?key=$_apiKey&q=$city';
    return await _performHttpGetRequest(url: url);
  }

  Future<ApiResponse> fetchForecast({required String city}) async {
    final String url = 'http://api.weatherapi.com/v1/forecast.json?key=$_apiKey&q=$city&days=7';
    return await _performHttpGetRequest(url: url);
  }

  Future<ApiResponse> _performHttpGetRequest({required String url}) async {
    try {
      var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return Success(data: response.body);
      }
      return Failure(statusCode: response.statusCode);
    } on TimeoutException {
      return ServerNotResponding();
    } catch (err) {
      return Failure(statusCode: 0);
    }
  }
}


final httpProvider = Provider<HttpClient>((ref) {
  return HttpClient();
});