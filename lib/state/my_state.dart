import 'package:computiq_task_week2/core/api_client.dart';
import 'package:computiq_task_week2/core/api_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WeatherLoadingState {
  loading,
  finished,
}

enum WeatherForecastLoadingState {
  loading,
  finished,
}

class MyState extends CustomChangeNotifier {
  late ProviderReference _ref;
  late ApiResponse _weather;
  late ApiResponse _weatherForecast;
  final regions = [
    'baghdad',
    'Basrah',
    'Dhi Qar',
    'Diyala',
    'Duhok',
    'Erbil',
    'Karbala',
    'Kirkuk',
    'Maysan',
    'Muthanna',
    'kufa',
    'Sulaymaniyah',
    'Wasit',
    'Al Anbar',
  ];

  late String currentRegion;

  ApiResponse get weather => _weather;

  ApiResponse get weatherForecast => _weatherForecast;

  MyState({required ProviderReference reference}) {
    _ref = reference;
    currentRegion = regions.first;
    fetchWeatherForecast();
  }

  // =================================================================
  WeatherLoadingState _weatherLoadingState = WeatherLoadingState.finished;

  WeatherLoadingState get weatherLoadingState => _weatherLoadingState;

  void updateLoadingStateTo(WeatherLoadingState update) {
    if (_weatherLoadingState != update) {
      _weatherLoadingState = update;
      notifyMyListeners();
    }
  }

  // =================================================================
  WeatherForecastLoadingState _weatherForecastLoadingState = WeatherForecastLoadingState.finished;

  WeatherForecastLoadingState get weatherForecastLoadingState => _weatherForecastLoadingState;

  void updateForecastLoadingStateTo(WeatherForecastLoadingState update) {
    if (_weatherForecastLoadingState != update) {
      _weatherForecastLoadingState = update;
      notifyMyListeners();
    }
  }

  // =================================================================

  Future<void> fetchWeather() async {
    updateLoadingStateTo(WeatherLoadingState.loading);
    _weather = await _ref.read(apiClientProvider).fetchWeather(city: currentRegion);
    updateLoadingStateTo(WeatherLoadingState.finished);
  }

// =================================================================
  Future<void> fetchWeatherForecast() async {
    updateForecastLoadingStateTo(WeatherForecastLoadingState.loading);
    _weatherForecast = await _ref.read(apiClientProvider).fetchForecast(city: currentRegion);
    updateForecastLoadingStateTo(WeatherForecastLoadingState.finished);
    notifyMyListeners();
  }

// =================================================================

  Future<void> updateCurrentRegion(String selectedRegion) async {
    if (currentRegion == selectedRegion) {
      return;
    }
    currentRegion = selectedRegion;
    fetchWeatherForecast();
  }
}

class CustomChangeNotifier extends ChangeNotifier {
  bool _isDisposed = false;

  void notifyMyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

//=============================================================================

final weatherStateProvider = ChangeNotifierProvider.autoDispose<MyState>((ref) {
  return MyState(reference: ref);
});

final weatherLoadingStateProvider = Provider.autoDispose<WeatherLoadingState>((ref) {
  var weatherNotifier = ref.watch(weatherStateProvider);
  return weatherNotifier.weatherLoadingState;
});

final weatherForecastLoadingStateProvider = Provider.autoDispose<WeatherForecastLoadingState>((ref) {
  var weatherNotifier = ref.watch(weatherStateProvider);
  return weatherNotifier.weatherForecastLoadingState;
});
